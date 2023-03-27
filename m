Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0A26CB0BC
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Mar 2023 23:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjC0VfD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Mar 2023 17:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjC0VfC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Mar 2023 17:35:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D5C268A
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:35:01 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id e65so12548120ybh.10
        for <linux-gpio@vger.kernel.org>; Mon, 27 Mar 2023 14:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679952900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EHLi/pEdydeVQSPS8JiUCU4b6C8ijlHrlnkCBX33qU=;
        b=F2CJBXF3tN3ocsEICdrW7raAYzXA4DkY/rbN8hYHJXAvuePg7dJuj7vxEUY8C6thKq
         h/6C2I/X9NL7sf2SqR0/Lgh2pOOXGn15t49+syX0LbjTH9jVOmVC3uxmVrJfmAzwxc9f
         xbdTnrg22udcZa/I2/VcUTMsLsnR+2bblNy1OpSaN/wjDAyrbx+tI/VErjeGACN5V791
         R4gBfZRuGsZcmXjKlSP+lm5k8wwNpmQXV2VpDRGF5FrQqGtzWH6l9bH2rB1gpY49oYSf
         Kk8jXQ4kr92b68FIJMs5bA+ZBNhWVAbEEG4gqcRrafQo7c9j3KjXf6HyrnxzsR7U6rzN
         ytVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679952900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+EHLi/pEdydeVQSPS8JiUCU4b6C8ijlHrlnkCBX33qU=;
        b=4TgPM0/8F/uBpXJrGuwrqew52YCM1j5IEQz+e2xjaSOVKipEKpOdenAzKKts2l7PxQ
         BzTYwRr7AsBE1d71POgwvqZKF+IzbCjMPRowESYOLAx+LJylboI1LOVbSQVfd03QgNMT
         gaOAmVW0mgFa7e8mG9UtxGeN56H8YpviPJ6wNlcPjZ9LTAty9PB8lB9WAcodTlPXzYxu
         Dz06yCLLIAhhKEFtlDmhNwLsOIiN19p901ejiH0oWj5qVKGB48N9Yrgglxmlps4noWrg
         Nh29EES4Uy6nzSQCAhwE9bSRHnSmfOA4GvaBrUc4XGr2op7KPSL3QWJPgoIUMLrirgym
         pSjA==
X-Gm-Message-State: AAQBX9dAxTb4v57+zgalZnCKfIfiR1ltXEM2AlSF/jyTS+574ApWlpUp
        S14PWzne+/Dip7bzPGJ2xKMPQGWiG4dRjy8DKOuUFoArFO1Q/fSV
X-Google-Smtp-Source: AKy350buTejEMU08heL381mSiUn8DJI9KfxE2hFsE8fiLlSzZGZOtsKIW4CPuTrSRNqaunMTwdabOeP+3ibsmmEKuLc=
X-Received: by 2002:a05:6902:120c:b0:b74:77fa:581d with SMTP id
 s12-20020a056902120c00b00b7477fa581dmr6463549ybu.4.1679952900593; Mon, 27 Mar
 2023 14:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230327062754.3326-1-clin@suse.com> <20230327062754.3326-2-clin@suse.com>
In-Reply-To: <20230327062754.3326-2-clin@suse.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Mar 2023 23:34:49 +0200
Message-ID: <CACRpkda0yLif_4vgeM74Y8M6GC2je=9eGH0rWnvRQCrPp5dNkw@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] pinctrl: s32: refine error/return/config checks
 and simplify driver codes
To:     Chester Lin <clin@suse.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        NXP S32 Linux Team <s32@nxp.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 27, 2023 at 8:28=E2=80=AFAM Chester Lin <clin@suse.com> wrote:

> Improve error/return code handlings and config checks in order to have
> better reliability and simplify driver codes such as removing/changing
> improper macros, blanks, print formats and helper calls.
>
> Signed-off-by: Chester Lin <clin@suse.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Patch applied!

Yours,
Linus Walleij

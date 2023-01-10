Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADBF8663A61
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jan 2023 09:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjAJIEZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 10 Jan 2023 03:04:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbjAJIEF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Jan 2023 03:04:05 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1093F442
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:04:04 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 194so8744599ybf.8
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jan 2023 00:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NJfrDMRrh3mxLMYRYmDj11BArEMMJazyj89K44ewmGM=;
        b=IslEC4jSInr/qN2/cTn9hilIgxafvO7z0QdmnkIAJFxJBDTHJxt78dZnokubnL9w07
         yh/OaM2vxofEM5yfRkKAJ//fEiJCVqMkFHab9vTafZZRCiczPzr95X3as1BYLveZYhPi
         cQKyCmLr8EEASmrzeNIBiUBlZrx192WtEtvta9yXP8HjI6UjOdiwCWSVBoN3krAKKOrK
         WWLZ32/mlaAPv/wgHWXNT0ZP3LanHZPuMNl0T1OhXZbMwgiock1Th9mGjhU7+vp1GXlE
         8ALrlzNzaEdG5/HcNxeEVuJbbtuP9GkZIjY+kqWRpeyUafU/YWj10jx8dHmjHFwRkOOM
         vsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJfrDMRrh3mxLMYRYmDj11BArEMMJazyj89K44ewmGM=;
        b=Uqyx/K56LhSIOUpA5g88xG1CQLZWTxYNUiZdU388LBELDRjDAlwFl663ZkknAmFS5Y
         aYRZfAbZ0aM+b99+cPTA0qutznUd+xG6q/jLcpZ1lDwrexb3qm6IBRl/K8QWVtpexIOI
         s61INm3m4/6T1xyTEFHP5QhI+TBcLJHw+Hx9Z1Ld8j5i4Quze4mzd17TrckiQbahhJdR
         U3fPhDUWt+8lRaepLJY3AaN7H85npJvChMv/tgyUbHddGcPVf4L1qqt2WeiGcMsTxH0B
         RUURcYORatP5EjYyGnqyax3VuLnzYa5pesAYt+uRMMMhgO1PwxkFbKdpl3tEGfjENToi
         fTLg==
X-Gm-Message-State: AFqh2kpC58kCNu+Mp2LmTEK5eoAaszsK9fmsdEKfp4u2kFOehVx0BPWl
        w1FduF2+EDq/c7xjkHmMebBY7GP0u8rb7aUrJqz0xQ==
X-Google-Smtp-Source: AMrXdXunX8P9QCS6rxnto5US8/ieh3cvv+QmQp394LAe5pwTiO2MVsLzrYk+F6BgrkuwbZpaFYQFc7mICeex51nvTSo=
X-Received: by 2002:a25:4903:0:b0:770:d766:b5e8 with SMTP id
 w3-20020a254903000000b00770d766b5e8mr4717308yba.24.1673337844060; Tue, 10 Jan
 2023 00:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20230109132719.86009-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230109132719.86009-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 09:03:52 +0100
Message-ID: <CACRpkda3K=D9OZ=3p0f9yjNat=HK07z38ExFz227us_Lgeuyuw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: pinmux: Drop duplicate error message in pinmux_select()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 9, 2023 at 2:26 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> pinctrl_get_group_selector() prints an error message when group
> is not found in the list. No need to repeat this in the caller.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij

Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBEA7CD576
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Oct 2023 09:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjJRHZX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 18 Oct 2023 03:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjJRHZV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Oct 2023 03:25:21 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED11C6
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 00:25:19 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a87ac9d245so37296297b3.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Oct 2023 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697613919; x=1698218719; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drhxc4SxziTkS/apEPghSVran0U4xzMK688M0wpaHzU=;
        b=lRsos2bWNLszqoa65MfXngsTEsFlv0r1DBC9aP7yPmFUuGwr8UD3o0VPxcx+F/VkjJ
         hhSOSrNuAmQ1qBD1Z4+U3uaIlU7zhbmoS4rAabm9ahHZBAaOlrYAAOoHMhqCQgqrENfV
         nQpa6gVG3qT1C2VMda/TDm4O6NeeSqCjdADLMplh2P2qQqlkOZvpc5m4YzqfO3QCzc4p
         xQ2aBXPB3IrdKCkFr0aWLP52DHdeDAGzsakEOBIxWsB/8ePAOeYNyl8FxewxcOpqMuSP
         qdjhV/P7tvdJoISCeV49ibPezSxCNkkzqDcnn9X91JnBzxQ8LX/Yc43Q8ztQKQGYZWsR
         oTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697613919; x=1698218719;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drhxc4SxziTkS/apEPghSVran0U4xzMK688M0wpaHzU=;
        b=AA6poPOMY0509or0EA+RE7JpcgOT75oG3LQqSVicsojpb84C4zjWM4r6ulsVTxPqb/
         hanmU5g5OFNTX2hNT8uFX3DpogglEi0DH/+K9EeCpXSsOZ2KKFSmBmZutu7EwwRXydGH
         9SrZd4q/EVGNXc9M0+EMOOwZoHglr75Xe37KswjRY7vP7yeOtaERslyxaqyWGM2fuWlP
         b7jjOcFMjTbkS31HsMaapRGHMGbFZgn3IzMniWRnd8f+kTXRqk2voIofeUYc5LaBZI/Q
         KCeW6GBQRmXbullid0bOoO/O5oNhNE5bnHnVIO+MBuWfmF8T8YVul0zA7N9XO3dJ7Vab
         il+w==
X-Gm-Message-State: AOJu0YzT/BE5Y11oMZ/+hd23l0deJhRT2J08lAmdWEBlXWVdtJRZDaY2
        lBTIhuqLt39wIq22Ozts9mcwpP1UyVnXOng58PeziA==
X-Google-Smtp-Source: AGHT+IE1+cYfTFKo8MJHnl46DqN/x8rQL0lxYYayhvMXJb/fKcBDoW0+uyTJ/kAOLHVEZNYfvoVJW0pnEpRIyqZXbbs=
X-Received: by 2002:a05:690c:10c:b0:5a7:afc9:3579 with SMTP id
 bd12-20020a05690c010c00b005a7afc93579mr5235076ywb.18.1697613919181; Wed, 18
 Oct 2023 00:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <202309291530.qDP0N7ET-lkp@intel.com> <CACRpkda4SYP5twcxDGA_k4VzV0mh1Q190SZT0u7xqZykrPt=VA@mail.gmail.com>
 <97c8604460d34011b87eeb6b302a6b49@realtek.com>
In-Reply-To: <97c8604460d34011b87eeb6b302a6b49@realtek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Oct 2023 09:25:08 +0200
Message-ID: <CACRpkdbNQBBvEL0MRpn9vMrKWCDhuUDrwrSm+nB=b+K1zVw3xA@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel] BUILD SUCCESS WITH WARNING e8b4ff6a856d02ee64a6023edf45e11827badeef
To:     =?UTF-8?B?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
Cc:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 18, 2023 at 5:18=E2=80=AFAM TY_Chang[=E5=BC=B5=E5=AD=90=E9=80=
=B8] <tychang@realtek.com> wrote:

> Sorry for the delayed response. I was out of the office in the past few w=
eeks.

That happens, don't worry about it! I fixed up all the problems so it is
ready for merge.

Yours,
Linus Walleij

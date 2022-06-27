Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9000055B489
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jun 2022 02:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiF0ADj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 26 Jun 2022 20:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiF0ADh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 20:03:37 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82CF72BC4
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 17:03:36 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3177f4ce3e2so70624897b3.5
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jun 2022 17:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tV+5hEqlzeK4MVMUcyGrO+zWHO85wDG71TwH0FeAL48=;
        b=HZIsijKbkoPXss058615i66Dsx2x/uaFSU58tDBBNU/Kc9sJw1B9n7yb4t1CKlnCYg
         b8TCEfa5SdiUOO1IRFlnR4krDJAAB1RyFd05x8+Juv02VfAU4417tGiJHa2lVPI08gJM
         k9ANc5hrFHga7vBzEmYdr/1KpI/rsCU9N848M1DlAlf7/XG3FJrIQHIufcqgLkFcedNY
         vX5jp/NH290bQQp7xcxeqC++w1j1xyDVxOx3WexMRxrSTOZLywfj5E5B3d+tWRTKNoV0
         Gzh6HQtmLIrDAMtcuFW7nMbcio5vtjnc5L35Q72vvPwAaOXLidjI2bWbSNxetp0IyTQR
         juUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tV+5hEqlzeK4MVMUcyGrO+zWHO85wDG71TwH0FeAL48=;
        b=YSfaj6m3aT11Yw6j0xqRkxldOlfsoZhrF1sStV7WynpMrjy2aiTwjg9RRxQLVtpmuX
         jN4VNBNzTcgkF4dHCx1DWd/5GNwsoQFCC07q2kvAMWueNLw1iTN1j2Ww1zlCPq8YDxCX
         ea6NVQPUlu00E3mI+EO+PvQFLh78zE+prCl6xOCL/JtMneVL+snFW2eZdY2SjgPbGC0C
         GXkKoGnBOGQvXX334ZFou+cavmnPOzUyzLSSayFb+SMpFcMp2l0gW9r5unttgKlbR8DG
         zn1qQnxb5qYqcccXIyH0V3jPclrWFd7KsxdSpoWliwJhKFi8HcWJcc1DP+o4GwZ71Eql
         78VQ==
X-Gm-Message-State: AJIora8Lai3W86RlIeGX/+m0SRS75WeHJjlcfjXJwEB6YV+3mEdAkXVj
        L913PSomMl440eSjr0f9UYKDv9jK9z6utDfn/sqWBuEmAPY=
X-Google-Smtp-Source: AGRyM1t6F6k8xfGB/lriGMi/dUPI8ruSvMEKeLbClV/EBMxDsiKazBH6BpLMX24F1pYBJe51/9DUhoQuqK4geEYq4+I=
X-Received: by 2002:a0d:eace:0:b0:317:87ac:b3a8 with SMTP id
 t197-20020a0deace000000b0031787acb3a8mr12322750ywe.126.1656288215795; Sun, 26
 Jun 2022 17:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <202206260954.NjQGnygt-lkp@intel.com> <37cb3f3239c9be1dd18e576e4823f364679bb44a.camel@mediatek.com>
In-Reply-To: <37cb3f3239c9be1dd18e576e4823f364679bb44a.camel@mediatek.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 27 Jun 2022 02:03:24 +0200
Message-ID: <CACRpkdYxaZqw60Wui-8=mziPvfkvuS_nQE=03y3VCbzBdc61vQ@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 17/19] drivers/pinctrl/mediatek/pinctrl-mt8192.c:1362:56:
 warning: "/*" within comment
To:     Guodong Liu <guodong.liu@mediatek.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-gpio@vger.kernel.org,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 26, 2022 at 6:48 AM Guodong Liu <guodong.liu@mediatek.com> wrote:

> Fixed in Next patch, thanks!

I don't know which patch you mean, I just wrote a patch to fix it
so my tree builds cleanly, thanks!

Yours,
Linus Walleij

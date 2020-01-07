Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95DCF132646
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2020 13:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbgAGMgD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 07:36:03 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:36370 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbgAGMgD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 07:36:03 -0500
Received: by mail-lf1-f66.google.com with SMTP id n12so38759895lfe.3
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PEoORwEbsUG1Ph5wXGdlUAhRRrmp+B4iCncPMoayctA=;
        b=xDkHw1xoDyT1+NKE4FAkLZOcOipCNbmSuHLUXq6ZMzyhAKZj4lPa7kOVeCGAgloCkb
         RWuWt39XtVe0z8vGnakEPRQnc1bLL5UhOYqRQe2zB0txSM5iVA9aD6nD/GRae74CYPbN
         QZEFC1ydPS/zGiJUssgC4Oy3Jg+KI2dxrW33XAcz++CngbHnag3fWk1HRVfiXFuDK2WC
         uVCE1gv3rUmS3H+bHy+QBtu6j0z/eAG+uLCH8m6dlj+94rIrSJPFv2tUkanHspR987YU
         XmpcQPo1IP/GVKPBBrxxIQHSxfX8OmX4eBAGQ6xr3w0gr06skG4T0KS9ajnSLB73bO0x
         dLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PEoORwEbsUG1Ph5wXGdlUAhRRrmp+B4iCncPMoayctA=;
        b=unTLsmpz/6o+7l8q6lthl4xWhOGfcx8seO3Gyn9T1/2r+wvDw424VOGpgIoiOED+a/
         oiEvZWGjiMOU01GqAvpVzKJzJ/VFx8lCnjKtTiqGzb6VjM/BgAQIQ2whUx3r2zmGfj5N
         7+WwskO5utCAGkXigGWKj3WoYn00lvlhJMUa2tunrZ7EklDf/rmHSLyCGhULSgrfFR+A
         nVR+X23g+AEQrBsMt7e70U7B57EtxLOpuX1rfh0LeOFqQUrPyj9o8LYbY2ljiqJzRDhW
         cMU/eAGYaUeriRWo2qaNh7a5vpSe6Fwof2STMMPxZQXvx7u8W5sB6FBN1tPFzJ5ulaSy
         /90Q==
X-Gm-Message-State: APjAAAVjzWni6qOY7zVkjkMXuvx2FSr26624vv7vijfBOOjlwz0MXKM8
        ng9TetJc0yCzai3pg0xoJVqG2HVVQXJUyvw48GM0PsjA92c=
X-Google-Smtp-Source: APXvYqzQqj/JBGr6OJKJAmXaRApKrKP4NLNTitBufrrGzAHgS1IC+s4VGVolDF8FaQakj9vICEx/+KMnmbO4wDB8q/E=
X-Received: by 2002:a19:2389:: with SMTP id j131mr56980841lfj.86.1578400561366;
 Tue, 07 Jan 2020 04:36:01 -0800 (PST)
MIME-Version: 1.0
References: <20200106232711.559727-1-paul@crapouillou.net>
In-Reply-To: <20200106232711.559727-1-paul@crapouillou.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 13:35:50 +0100
Message-ID: <CACRpkdYo0dniDAq12WG=KWmJPjnuYEtDn=pvHRoRGRhzQUX58w@mail.gmail.com>
Subject: Re: [PATCH 0/5] pinctrl: ingenic: cleanups
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 7, 2020 at 12:27 AM Paul Cercueil <paul@crapouillou.net> wrote:

> I saw you merged Zhou's patchset, here are some cleanup patches for
> pinctrl-ingenic that should be applied on top of his commits.

All five patches applied!

Zhou can you test the result? I am pushing the devel branch
out and as soon as it builds cleanly I will push it for-next.

Yours,
Linus Walleij

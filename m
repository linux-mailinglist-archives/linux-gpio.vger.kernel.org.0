Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858511ABEE6
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 13:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2632750AbgDPLNx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 07:13:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505858AbgDPLLO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 07:11:14 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EE58C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:11:11 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q22so7411003ljg.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 04:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DagzPuCV35qt33fGvPGLDoiS08sYzbb9yy87y7EAnZ0=;
        b=yet1Q0fX4nxzU8FeSJeMbsR/4M4ZR8bSZgTYXnm3b33HHgDAoFiGGbEVV4TxE3vhsD
         /c2AJ4eKsLOLbAMS8meVpOJBnXQX4HaYBk/E4mO/kE7Qx15xwDrn79DqsnaQKBdPX72/
         9AC/Nlvz6XGq4HUe2sfq8jP1MF1spNg/BW1C10iPp8ZwR/qYFHcIp6w8D37lenRxH3+d
         QMT/GjndGpsyFcpVXgKMwHXurfH4Ri52ptjqKfjhQDs6tHzXng01V2kKubCYftC5vUbE
         CodkmrdPVAcWtHmXRqehK2nzSMW+0LQSwyvkE09yxCKcEZThbjK0bRaMhUhgJU4enXbO
         pl5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DagzPuCV35qt33fGvPGLDoiS08sYzbb9yy87y7EAnZ0=;
        b=mFWyDqOxsuUzLmdVBi3UbxUJizvE3i5DgLtfVV15G8b989GJuqCx9fCWG4fr9UTELT
         I2fCe/qNeX/zkoAf0m93lI2e/GrF829B/tK0aNTX6RIEQhsmVn9LSe2i4OAxQAbJO6rJ
         AosEW0g6UHN5fs8EOgjMD1uK+XLAPX8ObtGgX8dvTp/C8OI3PtlzUuVrsf+o0UnBjmFV
         BBaewaRc4pIp1sw4FSXpsAe56kH7zcwR3KuL66ZIBEIzZNmPxWPUxJuLXrifLGe/yhJ1
         eFrGvc1pDnnKGFk9/RtKm9j4vllx8sBuqIf03RsltLJLqgPZ7MedZTN7cYt9u5n5vBDm
         iy5w==
X-Gm-Message-State: AGi0Pub1vQU5kwRTluIHPv91birGsbOnt1h9FFTQAIE9Za47vMHvYwR8
        aSjPxbVQJO10XGTK2IZlRJ+a2SdY/7xRBbXeQ7UenA==
X-Google-Smtp-Source: APiQypIe+xRjUiPUhs+Ll7NpUdbW/Z87i6LFhQq3LlYlzagCdixZd6a64fsv5yfIf2axg5JsvTgNsUrB0uS0JAF3Xd4=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr5942226ljh.258.1587035469976;
 Thu, 16 Apr 2020 04:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <1586757913-5438-1-git-send-email-amittomer25@gmail.com>
In-Reply-To: <1586757913-5438-1-git-send-email-amittomer25@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 13:10:59 +0200
Message-ID: <CACRpkda8bZQnQhNbwXPrf-8mZh2NhsPx3u1Gcpmi8KjUEd-17w@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: actions: fix function group name for i2c0_group
To:     Amit Singh Tomar <amittomer25@gmail.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Matheus Castello <matheus@castello.eng.br>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Apr 13, 2020 at 8:05 AM Amit Singh Tomar <amittomer25@gmail.com> wrote:

> After commit 6f87359e8bca ("pinctrl: actions: Fix functions groups names
> for S700 SoC") following error has been observed while booting Linux on
> Cubieboard7-lite(based on S700 SoC).
>
> [    1.206245] pinctrl-s700 e01b0000.pinctrl: invalid group "i2c0_mfp" for function "i2c0"
>
> This commit fixes it by using correct name for i2c0_group.
>
> Fixes: 6f87359e8bca ("pinctrl: actions: Fix functions groups names for S700 SoC")
> Signed-off-by: Amit Singh Tomar <amittomer25@gmail.com>

Patch applied with Mani's ACK.

Yours,
Linus Walleij

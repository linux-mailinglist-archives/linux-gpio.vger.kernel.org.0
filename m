Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598EDB0E6D
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2019 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731528AbfILMBR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Sep 2019 08:01:17 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43260 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfILMBR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Sep 2019 08:01:17 -0400
Received: by mail-lf1-f67.google.com with SMTP id u3so4000725lfl.10
        for <linux-gpio@vger.kernel.org>; Thu, 12 Sep 2019 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+KUaKRozmj9MhbNeHfmxbGBvkbW3cvd5G+N9N9TBXM=;
        b=GKv1qDnJSNRxPyoVA5mhBQU/+djHCITs/mJgu5UnUu/V/BNM4EkaJxhPIoQiXPK/6/
         lzdLo397iX1mgkC5aSm7IL420wqfqyVnaCzdcEtSmsZW+iH2325tS3398AJve7mRdaO6
         JJjRd5w0yJ6BZz60dwRQ/Ec9BkmgWDYRo9beV/fX8pxWTMw4Chp8RAWzA+5+Ln/9hWOz
         A9A+LBNXviLTBak+0NnUkGKNfaeNfpsaf5/MBd3d8DfGT+bZh0icEpth2XIdJONnM9zW
         7gyYH+X5olhxuE+AniDlfUtPXF86f++QHrAMjmcK9NyTdnAH0Go252exevHp2OhXVzH3
         /Vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+KUaKRozmj9MhbNeHfmxbGBvkbW3cvd5G+N9N9TBXM=;
        b=oVl2/zctFkXcGjR6ihhATLBTA45/SA1hslLS5IEAm69Lr46W9MyDr07L793PmvhkrR
         y1ufYMKNBfZ/XVPMe+/oeYVKusM/SgwMdUqRWQiwixB/FbGJGk7y+F/RuuuwsOFBoXSO
         MtH/GrZouJAe7tuXbKqpnbWbi+nUtXRhy3zjzQ7pxqUTHe/PgmR190R8RHPuNSbsljho
         eJnfuaZA1TUPBg2pTFgnzz1rwPJvoCv3y+uLt8c66Fp1VVMFMKt7Cz7iVtxZ3v95v7C2
         SNE9qXi0ky8X/uNlXgwLzbu6jmmr1JOB2Uf2uJmE25/lrhrEasxXzTBE1035c4i7ue6p
         fzPw==
X-Gm-Message-State: APjAAAVCv0YXpRuJXZKtu6OFlxVWdE80kwjYs+VuRxprpt/JyDaggK9f
        B6Xg2U3tYHfrIOnm42H6sy6zvXPht2yUoetshdm/WA==
X-Google-Smtp-Source: APXvYqz7TmCb0iFOGja4A3HJL4YEW41PboaxDwufY4ujKzw1ClTCCkOCVi7WXFPfX/pILiG588HXmotxuzPvBcWEELg=
X-Received: by 2002:a19:117:: with SMTP id 23mr27924292lfb.115.1568289675144;
 Thu, 12 Sep 2019 05:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 13:01:03 +0100
Message-ID: <CACRpkdbG0bz40U8qFSvi6ds-8XiUSX+yj1uC4XynyAfJWfantA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 27, 2019 at 10:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock and enable IRQs before we return on this error path.
>
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for v5.4 with the ACKs.

Yours,
Linus Walleij

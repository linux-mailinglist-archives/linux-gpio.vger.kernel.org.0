Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6FF319B2B
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 09:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhBLIYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 03:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhBLIYu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 03:24:50 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3504FC0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:24:10 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id b16so10550516lji.13
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 00:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4QtRP7t8Cqt7Zt0AmnpBiTpw0QsRRYsCTiIBHf9N+0A=;
        b=rVogwN5qGXKHZw8jS8KeHozl1/d1t7cbJm5keBbB1liAdxUF4/orhzCcSoBKp3WjWG
         HqHTbQUdLkmJTkh2da/AZSLEr9BTF7I3VVPO6Jb6XPcwox6Np69iyk4PsM/6199zqAED
         jIZw5+Xj24j3inqJxZYbTSSPYg8fe/7nSgX98xUYC629YxIQNTlTTgxMxTsKqIe5hvqw
         dXm7+O3gg4o4OABeWyfzADBxDo1XUzAm96axWnwdq92npgnjux7b6NBC+i9JiRgmg0Cl
         AoVguj1asIsC6gredLH2SOyaPDTeu9+UQnZv4au1UF4IREvA1i3XqIwV6LnPQk6LQq7l
         TZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4QtRP7t8Cqt7Zt0AmnpBiTpw0QsRRYsCTiIBHf9N+0A=;
        b=BLW6jNW2v2iUl/rhGtFsStryIfRekhj/JxVcGFlpH/hx5KzF1TlTRS3eg/vF6CprFF
         9kbvTpxcdbdCTqX8yBZUgV3oN55yEZKZC94uTYdo8/P3Um1VaNTg53jGf4Fi0oKA7r2U
         g3uADwHB84kdTOrBbhduEGXPDW9bOl3JOd66O16dFlrOl+LmVrG0nYZJbtdRD0JSGN9o
         qeDMPVWQbTkr2udDcSS3OZ8+1588QPgP4lFeyToB3Xg9TwyK5zs+NIwt/UIcdd+cNwHZ
         D/v1pfVJWLiKO76cQ3CZIOTlkbl6pSP7NZwNQcbSd0c5BcBWLVZIjic9+C44/WV2PxEd
         wmbA==
X-Gm-Message-State: AOAM531F7gg24xmeTYSzAUi/N3jrvaB5MYNfAhSQykS8EUJFzS4dkdVx
        m+CKniIxuXeTOceI8eMTd+MZi2fOTD2vE7JIpDLrVg==
X-Google-Smtp-Source: ABdhPJzquUd4ZWErN3S/4cnERxh6F+nJs7jN3KlfXXxGcEQ6JrbmiYABGJcLHhMWvsSJIoytqcDddlQIcZMpRAkowWY=
X-Received: by 2002:a2e:a403:: with SMTP id p3mr1054267ljn.368.1613118248643;
 Fri, 12 Feb 2021 00:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20210130162954.918803-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210130162954.918803-1-j.neuschaefer@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 09:23:57 +0100
Message-ID: <CACRpkda8EK+Y7mtcO3VZ2iL6fO_dNP-wzTbVSPvPL+Y0hG7g7g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: npcm7xx: Fix alignment of table header comment
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 30, 2021 at 5:30 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

> Make it so that each column label is in the column that it is supposed
> to refer to.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>

Patch applied, sorry for delay.

Yours,
Linus Walleij

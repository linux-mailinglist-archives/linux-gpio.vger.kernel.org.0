Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6AA13A7EC
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2020 12:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728983AbgANLHr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jan 2020 06:07:47 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41355 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgANLHr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jan 2020 06:07:47 -0500
Received: by mail-il1-f194.google.com with SMTP id f10so11105893ils.8
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2020 03:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=8+13JBzm9w//paXyYD3dcYefDbd5m/BGZsgiy8L6rcg=;
        b=foYCakAdZjsNKIpPdNNgtY6gFTDoGOYlYbdnnVkVHed6GSuAWm2vs6ZEPmPKm/Vd15
         LcaHw+IAWz40c1S0J35x+OrV0GiwuWxQkt5zSKPJQbWDk4DVFyNreyu3kh1zB8+JNz5e
         hEty+z9+ELlWwzpkeXYccWMS+o7+vNFVD6e15GWG5xhU+bR3viBCs3UR+iGabWyAQnid
         O0OU3cbppu99+TfYgbGuU+6Jf3Hxi/lJau92lth7tKvZWdhKMrGrm1A+NBCkJ1pkev0o
         Y2Ia4P6Web9/UM4OK8HBPzWW1jfNoToR0nbytXpYtSQBZM5GGPR9NtUYOt4RFSauP2OM
         czOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8+13JBzm9w//paXyYD3dcYefDbd5m/BGZsgiy8L6rcg=;
        b=tadzeFIyrKttBiBYspILfQtC7aHVbaVH6tQNn0/C7JCv1EGzImRUXRNvCo9Bwiogje
         woT8diOTijitKcZ+M2oYcrXx9yVnnHyutMS3Ry+a5J4mWNcWkF6KEiQ4ABFBaIoSHGIw
         EOUtcV/vi3H9+QF5w7toRe249kp4/DwMLy5J5iDN1QS5DNpI5IQgzqnX/9ymZxKd1UPL
         BFR7QFvW85BASsEnMNatjc45yS3yiPI/CLoaRrm+3mBUvMUr7kVksNCxnj8Cb9pu2hve
         WBPkhg97TZgI6Cz1RMkTu1XChgCM+3XGtd7NIR/r3ISRxpvK++KVgmf1xQaYBjZke8U9
         KDXw==
X-Gm-Message-State: APjAAAW7a1CIIGvUunzEqKqwCVUueNcxIcqTjk5yJiyMOZ9c/dbYGCI8
        3bscFe8wQNjfM+kTjKAdNG6j8ira5QtbrsI7kHYUJ2gP/G8=
X-Google-Smtp-Source: APXvYqyoChUBfafor0GK3lvGiVndTo1LcxmAyhiqNuIhn7wO6wAqCsF1Bt9UOPwXrM+52Fa37uGsRUC3WTUM9f58tRw=
X-Received: by 2002:a92:b6db:: with SMTP id m88mr2863177ill.220.1579000066502;
 Tue, 14 Jan 2020 03:07:46 -0800 (PST)
MIME-Version: 1.0
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 14 Jan 2020 12:07:35 +0100
Message-ID: <CAMRc=MeEvBycEoNb0+2jq1CGHQNw6W+ru+z=wy=UdVMSmF2SWA@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v1.5-rc2
To:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Drew Fustini <drew@pdp7.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is hopefully the last rc before v1.5 is released. There's only
one small fix to packaging since rc1.

The sources as usual are available at:

    git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git

The release tarballs can be downloaded from:

    https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/

Best regards,
Bartosz Golaszewski

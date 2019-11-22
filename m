Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35190107287
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Nov 2019 13:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfKVMyt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Nov 2019 07:54:49 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44195 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfKVMyt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Nov 2019 07:54:49 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so4387233lfa.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Nov 2019 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OG50UWayPIvArcjGQie+7s9WHqHtX+folJX7ygZx60Q=;
        b=JJ3KRgl/mgm/zPoJWzx69dPATcieIl6pzOnf0+t2sIUivFjhW6SNKkL9mLhZy+F6wY
         N/xVg8z4+oAzxmiwd844eE9RZokPf36VKp5ur0d/kb9mW96kZEM0M3losANKfIUTiubE
         53ZA7Tuy4Q2yz5GCBK5FNKuAriXTVjtdSHG8lwPT8HJBZCaZplWV5t1GR2dN5I+2YjYk
         +TkZjJc98g1lP5tj/3+c8EN1p4f3DKqpn54kAIEu3tP43ogOcjSI9+EkInz5l4IuGJdp
         +b2qE5ZiNtwEhvP1T3w/XFlxvhSkmBzBGr29rg2uw40Lt1Kw/xJ+BOx9ALaTAqWWfM6/
         r5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OG50UWayPIvArcjGQie+7s9WHqHtX+folJX7ygZx60Q=;
        b=n2HoeQePp7WtyWbevLjOKwOkqCPJgZ/wf5PczQbNJ8AyCpE5Pk65L4U3GyKiWv29o0
         qfw6P22B1MCwFtm3/O4B2v+8/PpokrGn03U2Lr25bPT4SkC/Me3GhrHcJ9YF6qolMKBZ
         aG8NlF8pRg7PtUqHBPJxO8ZPU80P0LheyoS9UPXa4k4th1hN48RmGShz0DdqTZ9kmi5C
         ZSLejtZ3NyXsp/1g4ILFisbZfug94eqH6qLpJ52Qeh2KR15z2Ymrln/dwD2YJmGTWfqE
         rvsoJWCIXVWbO12INxrRMrsPLvF06frGwkiQXgQTJcsumYXqC6b3FNm+Z0NMliBRlliQ
         rFkg==
X-Gm-Message-State: APjAAAUks9f74vO+4S5WeufcIOEtYmkuDNy2VhwSZBdz86fQiBjKKFIJ
        2a4BnbQaTGtZk2c27z5TgpPmedvjZluilfTgVyxYeNoTPgE=
X-Google-Smtp-Source: APXvYqwfGG9UOGbr27UFMVNJJBbk12jOLo5AxlXG93d1P/c0iskcM/BLeVPzGBvUy8PL8zpvuBrBnO6PsRyjwbj3lKc=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr11955994lfn.44.1574427286678;
 Fri, 22 Nov 2019 04:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20191120143745.1254-1-geert+renesas@glider.be>
In-Reply-To: <20191120143745.1254-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 13:54:34 +0100
Message-ID: <CACRpkdb_6sT2mMUxCzXnV_q16SB2mQWrxVyRthQiXmvzOcn=yg@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Grammar s/manager/managed/
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 20, 2019 at 3:37 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied!

Yours,
Linus Walleij

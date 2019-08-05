Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2739881831
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 13:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728546AbfHELbz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 07:31:55 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38020 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728455AbfHELbz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:31:55 -0400
Received: by mail-lf1-f67.google.com with SMTP id h28so57616720lfj.5
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XqgUfzAKvpX0SuFuxycUxR+geG5thbx1whP2WWmJ1nQ=;
        b=IKMwXg/T/Zh3tXmQ80wWZi72qUbtkNadQI+7xflFTFtdO1PFNpiA/v5J66oHKGOnte
         ve4IoeOLk1m1BddQ8EYHJwJMjWWL+CZoIb60NOOB9+3AkFZ+v81oaPKDrmnABXpZzBP+
         OQWS2dEj9zO0X5o+Civ4c8DEZdR76pV/opay7VlcpN+D6q5zwv2VHggImu19oiw1LUSh
         IJ9jVv6jV1WHC5Iul8rlsDy8GdmhH1josnnRnzFmyWEqtDH3TkZpi6TRZNwX4s6sSXvK
         hu3fG1un26ZOIigZiWk8leCxvia7QDU5m/4IYJUePVQ9l0gEu78GQltHUWEUTBxgI24s
         vYTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XqgUfzAKvpX0SuFuxycUxR+geG5thbx1whP2WWmJ1nQ=;
        b=GQxQPw0VT7Qs0P32Nvhyl91RkBh48eekemhtxIcN1QP72g/KFFZuU61SLjrEH6lVMn
         /Uv8YIGTB3c60X+fOkRJd2dLa9yLXuO/CZ+PukTAKQGgbAEqt+l7/lfjnzHTxPC6u4dk
         eXVcNMWZYKIN5DOpKSdU7dYewmqsdMv6RA2ODIdmasWGD7CaJjbh8A8IZzDttvDWIZHQ
         BzwWE5EV5zaq5LnPPb24K2sWG41HSxfYEirzk6AKm7i7ErU+n4+9mdlvkwTvobI5PPi6
         CrlUE/fYicD+BH2Nh8el3tp+GWtyt1Yaw+G1U4IaUdQK/nAW4QREF5yf/yJam4jsNU0R
         mQqA==
X-Gm-Message-State: APjAAAUYnf2JhRXX/MapRO+mafWp/7RHdZXRCW6bLJD9GdHGC9Ddl8WT
        ZIyPyXSpqPO+zgqPyelk8IINaQU9FPcBQ1tXIPcU9g==
X-Google-Smtp-Source: APXvYqyzg+cAuOf+j3i2y/o+8wNk9AYsXWTCWpPwk2uwxRInVloNTHNotDlkamFynu15VYZS4xipDjrVNnZSzVl/RLA=
X-Received: by 2002:a19:e006:: with SMTP id x6mr69619045lfg.165.1565004713169;
 Mon, 05 Aug 2019 04:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190731132917.17607-1-geert+renesas@glider.be> <20190731132917.17607-4-geert+renesas@glider.be>
In-Reply-To: <20190731132917.17607-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:31:41 +0200
Message-ID: <CACRpkdZA-NTq8dSrD1+_igd7qrFQkJvHhLkippBUu1UXkPWWNg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: xway: Use devm_kasprintf() instead of fixed
 buffer formatting
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 31, 2019 at 3:29 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Improve readability and maintainability by replacing a hardcoded string
> allocation and formatting by the use of the devm_kasprintf() helper.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij

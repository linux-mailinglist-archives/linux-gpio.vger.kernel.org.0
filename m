Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF0E1165B72
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2020 11:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbgBTK0s (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 Feb 2020 05:26:48 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43184 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgBTK0s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Feb 2020 05:26:48 -0500
Received: by mail-qk1-f194.google.com with SMTP id p7so3012176qkh.10
        for <linux-gpio@vger.kernel.org>; Thu, 20 Feb 2020 02:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=XW0RVUOafRWzBn6AHPCLH2bW11TB9C9eIVtZb1rn20I=;
        b=GOTeP2csS3xkcJ6a9/1t+PpPHy/Ce5CQ2FHQlbIQWzc6QcNwzZC8jt2NT60YL088wR
         1BCx6egwQ3pNCKjmdgReg7Kl2q5LvlvYnNxc1XaXce3ERZQtiahMXw1w7dP9a84Md942
         W9aAH1ejPT2Snn/8pyDsMUgdkFJoF1XTKUTaQ/k7TDslqU/EhmCFYGw+A27naDMfucF7
         Do1mqV5OT4OQTjJatcSu4w4ZEX8E/8ot6knRdCQmnpNi+uncCzvGqHm9nlU0sXSrysMd
         6Z42C8aoVna0JGz9bxdP/n0V/VbUNyIpL4lQt4IhnokFtUQpLSWtYQan0p+fSBtKnCgt
         FGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XW0RVUOafRWzBn6AHPCLH2bW11TB9C9eIVtZb1rn20I=;
        b=ey7TSh1nb8BVRmorRtYDo8eshNRB0Z3OBtd/ylk7dKTPP4Mxv4kUbrH6R0MtWKl8uZ
         pxK9zVc3p7C3obmSYWlq0MlOXCqHMKYx+0Lr4JGPrLNlVRetQuhlwT4DzLogvfgu65IG
         DZlc0JEAIWQbwxl2Vb7QCA2/h9fWYR7IQHnO2KTAKv0bc5PmZ/EaDwsYAB1fUxVfT77i
         s+3uUcn9fzeHGbISmfBc4iVDrCWzCWqVW1Iwn9goA9hdLKvCgHyhKdx9vZTg4bRUA0mk
         KjueaJejX1Rj3JAKK2DoYSsxzebI6qr1J/MkxkOllhP3L8QUWPJD/bOFnGBYswBNEtFa
         ZLQw==
X-Gm-Message-State: APjAAAVtSSbfqDXYRsLSUm6+B879FQje92U87Q1dj2OOC2i40gZVuAX5
        P5aGZq7/Uwa6j6INTKuZk8EuGqU8xZWojyEboqXNiQ==
X-Google-Smtp-Source: APXvYqxZ/p9N0WN3fKI6WmMbU+UuLuuiId4wUYvQin8O/qYIMdHBWbfAsTzerfcyHk8G256I9CsY4ittloiK3eWs0hA=
X-Received: by 2002:a37:a488:: with SMTP id n130mr26958458qke.120.1582194407546;
 Thu, 20 Feb 2020 02:26:47 -0800 (PST)
MIME-Version: 1.0
References: <1581942793-19468-1-git-send-email-srinivas.neeli@xilinx.com> <1581942793-19468-4-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1581942793-19468-4-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 20 Feb 2020 11:26:36 +0100
Message-ID: <CAMpxmJWshBbSxL1FrOrb=Rq2bRvvijoaLn5xq5HxA01k0qX7BA@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] devicetree-binding: Add pmc gpio node
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 17 lut 2020 o 13:33 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add the pmc gpio node to the device tree.
>

Same here: I don't know what pmc gpio node is nor do I need to. Please
make your commit messages more verbose.

Bartosz

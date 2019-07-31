Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB7B97D189
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Aug 2019 00:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbfGaWvR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Jul 2019 18:51:17 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44640 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfGaWvR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Jul 2019 18:51:17 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so32641829pfe.11
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2019 15:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:to:subject:user-agent:date;
        bh=kNom0XDDyLvYo0L/sHUAP/xcvFkJFIZFIiAZ17RPWiA=;
        b=L+aUySrckI5fz5GvFvDqsgG7QB2ta++ZEzEpeSZ+7w4FJ11HvjeBK9WPX6iJXl0A5j
         qA3/N0zeiEd1aLWkwS+JYWT6Xuv5KAdTAOMcJ6ODPSsQ5bIHb5kjiFQSVD2RdgxlgGI3
         fqUi/t6n/Mid8quRZBdKyoPfSpvRB7SX5i/oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:to:subject
         :user-agent:date;
        bh=kNom0XDDyLvYo0L/sHUAP/xcvFkJFIZFIiAZ17RPWiA=;
        b=J7Siq4A7zSuAafcjIzaK3m72fEi2XIjR9TqHqx5u0ZWS3gw45v5WpXjHh/pLbzHkkb
         ZtSSAZlCe1e9DKMVxpuP/v669KN48s8+B50ZK58gFXIDMyZQMjJeqA5YmMPxmrRa8//D
         ngpHvCUAM2yI1QNQl5L6x6vaMcOB0RCZNmRSBmRtjw0NHPASS36clUIgT3JP3D/V7KrZ
         AbD9RCMaJhx1fYSAxWtlO39ALfYw6/2n1zEngDDcnCWwHKeyMt2NFYhNk1rKUkvdMTry
         lYuV5OzekyCDhrZsMrxE9YUnTiAlcO2PDkkJKpR5rNy1PPTSHDzNrwrNz3slqPsMMACR
         jUkQ==
X-Gm-Message-State: APjAAAXg8Osww958JVRHfufSP0AB1avOT8obAEEzOIMbysAx0qm38WEG
        Cf1NzVNJPsTqI6SYeWppSltQNw==
X-Google-Smtp-Source: APXvYqx2liEocjlZKr6QTWJsnoeGNpQnUOEh4JxWaifc+x8sJVNvubnOZ9bz3H3Qcl83p1f09QQwGQ==
X-Received: by 2002:a65:6448:: with SMTP id s8mr116415479pgv.223.1564613476167;
        Wed, 31 Jul 2019 15:51:16 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id k64sm50628498pge.65.2019.07.31.15.51.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 15:51:15 -0700 (PDT)
Message-ID: <5d421b63.1c69fb81.e3ed.32c2@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190731224208.30429-1-linus.walleij@linaro.org>
References: <20190731224208.30429-1-linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: of: Fix hard-assigned valid_mask for OF case
User-Agent: alot/0.8.1
Date:   Wed, 31 Jul 2019 15:51:14 -0700
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Linus Walleij (2019-07-31 15:42:08)
> From: Stephen Boyd <swboyd@chromium.org>
>=20
> The recent refactoring to break out OF code to its own file
> contained a bug by yours truly letting the need_valid_mask

I'm not yours truly :)

> be overridden by the need of the device tree range check,
> and if there were no ranges, but device tree was active
> and the reserved GPIO used in another way, things likely
> crash.
>=20
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Thanks for taking care of writing up the commit text for me.


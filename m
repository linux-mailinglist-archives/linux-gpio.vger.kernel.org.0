Return-Path: <linux-gpio+bounces-1267-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7C80DC58
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 22:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABABC1F21BE6
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Dec 2023 21:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB98F5467E;
	Mon, 11 Dec 2023 21:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P/w7G0Wj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DB9CD
	for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 13:02:33 -0800 (PST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5d33574f64eso49267387b3.3
        for <linux-gpio@vger.kernel.org>; Mon, 11 Dec 2023 13:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702328553; x=1702933353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=P/w7G0WjSFdG4l3M3g02vvLEnBwqml1AyvE2NiC1NCLAynYfl1BMPYI3oV+Ch/cMDk
         tI9Jb9aSKXXSvTPAJO6QG5J8jHRWZ8kZ0zWUf9Lzgjo7kjeUEyQZo51b+YVri6SqOLUT
         ZLWZHQWvLskk05QRZsBxBrcHngBOi2nLjxH0dLomEeeHv84Q9IhAcr9kzQlCJ8YFYRoF
         TNv7sjkbbL0JrrhylrAYlK0u+vEFl5wXqBWMzdgk0KST6a8Wc3aIdro35AcA2Xyx3JW9
         joFnb7/ESr+prdztc5JC//6ur24+npmd9CDLu3dJzjZ9jyccf2WotzpNsC5k9qrm7F5G
         gxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702328553; x=1702933353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZfsZrrRBlZwfErbKCDlnyMZePAWlHxlE0E9UWOYGmQ=;
        b=PPNAcn0JVuXYffwRestla2Qb4gdZECkSOJXlfJKOFyd0ojej4g+ghoeBmE9+1oJGjy
         uiQyioAjSV3PlOOANdeH4U6ZdPmlUsDQ6/1DcgZfAdivjAtpMr6q3rhz1JG+V8QW8dT0
         +7ZRwHTX8ERsstmSy+86LRqkp9G0Yjfxx9nLa+mGFKlYutktD/IHGzyX4W9nu52ayU8a
         8+UfsYrRTR1J6nXPwIE5Fs3JUxAucLstAsrgEWy0yeQ1C3U7/32UAwSeoMKk3neBupVw
         DcCzpffMTpmQmyLvOaj1F+nuFZUfporFD4as0SuC/A400fwVp4xf71YsbjOCfvehKuEA
         4UXA==
X-Gm-Message-State: AOJu0Yxq7dHpe5ro6kaW9Gujnwy8pwRU07DP2qbpwVkqvUZAsYNSZPDz
	figcNAX/v7Ou8GsRpXZB6xrUMeYDyPAeNG8mgd5LWg==
X-Google-Smtp-Source: AGHT+IEx7mNSHR0hv8E+Jx+J+xIQnLDD997azEZuKMXEYCvggtMUMZoyCLaTgxmHG3TvQOqT3+BfMVSbsiM6LZX48/o=
X-Received: by 2002:a0d:f842:0:b0:5d7:1940:b377 with SMTP id
 i63-20020a0df842000000b005d71940b377mr3838384ywf.67.1702328552858; Mon, 11
 Dec 2023 13:02:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-10-peter.griffin@linaro.org>
In-Reply-To: <20231211162331.435900-10-peter.griffin@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Dec 2023 22:02:21 +0100
Message-ID: <CACRpkda8LJS+9dPQFqQLFDbj=gvJ9rKSu=ECczDB4QUv+FZgnw@mail.gmail.com>
Subject: Re: [PATCH v7 09/16] pinctrl: samsung: Add gs101 SoC pinctrl configuration
To: Peter Griffin <peter.griffin@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	cw00.choi@samsung.com, alim.akhtar@samsung.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, semen.protsenko@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 5:24=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> Add support for the pin-controller found on the gs101 SoC used in
> Pixel 6 phones.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Looks good to me.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I expect Krzysztof to merge this when he feels it is ready and
send to me by pull request.

Yours,
Linus Walleij


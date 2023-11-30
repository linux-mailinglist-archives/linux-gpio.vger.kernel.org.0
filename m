Return-Path: <linux-gpio+bounces-753-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC257FE9F5
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 08:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1CA282039
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Nov 2023 07:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD94720DC6;
	Thu, 30 Nov 2023 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZ4m63Vo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D126C10D9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 23:55:22 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-54bd7e5182cso559459a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701330921; x=1701935721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmZiZjvpBex4gcI04eLOJyAJ5t5SzkDiFqDMvfOAJ5I=;
        b=kZ4m63VovDbojZ+NnrIMxEo3p7BysYUDLJRKomKxTXYzBrSS0YginMEckYVdwfDnOz
         xNbGmYc0bWvFkrsn6vYSVWkVZ/7syKi7SCjSe2nu+OCL2NDTGK5Et5HDpXOXUSVjC89+
         SXr1rNMpZxT6bEOCyS/orTVfJ/LBwHfa1Ozn1kROHHCi14Ph2vOqORhNhUDJgjTkADvm
         vX0n75YdUq1XzsRL48CrnETMbdYkmlsP9Doiva6uQg2og3R6ufBRbCDALvrHF6UJ5bY8
         23ZbM8RYHIXoTzMn5+DU+AEWHdImOORkjMeG7XgcqT+MaNScNmiNq4moCq6XTG6nO0K2
         g7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701330921; x=1701935721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmZiZjvpBex4gcI04eLOJyAJ5t5SzkDiFqDMvfOAJ5I=;
        b=iBWfPtDET2oJ8YXjFiyA5F7JfsqFlLC9CrbusYAA9zKgAwPDy/Ha4Hfa7lcVjODH29
         TRhE2ubQasEWnSCcuBCvM/Swc5jKHtbPJQfOXAt+lNOAMasATNekBgFLcU4rTqF/SMQm
         K9PjRuhspEJX8aMBTrjF8NXiyFL0jwNKL2po9BRhfhsAxJrnzT1Vmc8bV001TiJJAncq
         E1T73FEelTckrKNp5Z3gGJqSzACO6GsP95EWEcNPXj1tgHQAM9jh5T+dIxaY6BQ3Ce/9
         hOA7Rs7gydA+8O+MjOpdL8YyQG6FoGwgWWBR9xrCKvxUKlYzifFSP9R3iO1eRdAzEcrM
         FerA==
X-Gm-Message-State: AOJu0Yy2ofBZzY74HmXe7WGlt5Wcmv/CDgWpRG+OvoGPrBo7iixra5X5
	Yy/PFMvJAk4mA9T51t5fzxrfEw==
X-Google-Smtp-Source: AGHT+IGEJFJJud5j9Fzl6gQW0ZgJYjI7kTFeop+xGL6tvHR+7fS5T2fIUIfa2sxukjpQQbokfOn1MA==
X-Received: by 2002:a17:907:9728:b0:9be:7b67:1673 with SMTP id jg40-20020a170907972800b009be7b671673mr18537863ejc.1.1701330921247;
        Wed, 29 Nov 2023 23:55:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id l14-20020a170906414e00b0099c53c4407dsm386981ejk.78.2023.11.29.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 23:55:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	alim.akhtar@samsung.com,
	linus.walleij@linaro.org,
	Youngmin Nam <youngmin.nam@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	semen.protsenko@linaro.org
Subject: Re: [PATCH v2] pinctrl: samsung: add irq_set_affinity() for non wake up external gpio interrupt
Date: Thu, 30 Nov 2023 08:55:17 +0100
Message-Id: <170133091468.5615.2831369258503569310.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231126094618.2545116-1-youngmin.nam@samsung.com>
References: <CGME20231126091120epcas2p4a1320e3b0f9be8f8a0f575a322981d38@epcas2p4.samsung.com> <20231126094618.2545116-1-youngmin.nam@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 26 Nov 2023 18:46:18 +0900, Youngmin Nam wrote:
> To support affinity setting for non wake up external gpio interrupt,
> add irq_set_affinity callback using irq number from pinctrl driver data.
> 
> Before this patch, changing the irq affinity of gpio interrupt is not possible:
> 
>     # cat /proc/irq/418/smp_affinity
>     3ff
>     # echo 00f > /proc/irq/418/smp_affinity
>     # cat /proc/irq/418/smp_affinity
>     3ff
>     # cat /proc/interrupts
>                CPU0       CPU1       CPU2       CPU3    ...
>     418:       3631          0          0          0    ...
> 
> [...]

Applied, thanks!

[1/1] pinctrl: samsung: add irq_set_affinity() for non wake up external gpio interrupt
      https://git.kernel.org/pinctrl/samsung/c/b77f5ef8ebe4d8ee3a712a216415d7f4d4d0acf2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Return-Path: <linux-gpio+bounces-30506-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF37CD1A9CD
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 18:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E1E5302E721
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 17:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62909350D50;
	Tue, 13 Jan 2026 17:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fMgNnZah"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27B334FF41
	for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325274; cv=none; b=sq1+PQdstVprMzNLwutBGS6PDX2vUmmJ9+NhQqz7MKZZpfb31Z6sF87cLxsvjxnt57GU8mV4zLsloKemiC0NDtgTwWrB38TOS1u4xuIm9Z/gp+YCPsIXkPSyVADd+3/JexPFK4BOGnGx3AZMxElgxkSMpiriLLq1jJoQCjzFkn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325274; c=relaxed/simple;
	bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jHFgHGbnFRnuJMvSgAEElJRJIxgG03SB7ld/FNk9cwwk4g+iW14aLem5w6EO42weiLzPP/20DRGBrq/KZQLvdyFuEXG9JVzGUutr/VbYdfSsrsm9Pzlqryxhr0PosvejwcU08+uCcO2Co/JzO3aKzbuCwr3eS1L/xLEuqD4sRcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fMgNnZah; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-81f47610542so1367354b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Jan 2026 09:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768325272; x=1768930072; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
        b=fMgNnZah+tRAxSaJewPIFrosBRbo01e9/jZaE9ir/CH03hixdrLA8IZKctOPryUPKu
         1wEbM6o/hRJuE2eD37Z6LuOCykY+6TujYzSGu93mSarbbDtDNYQdcB1yH781RnW2KLrr
         e+RHhJIcS5LRIVFlI+vBUUg8kFtyiMMzfmk6qhoo7epDjLfu9DZbFp5FT3lu1XQTsrIK
         fdjG+oOx7x2IyKkdqe5Xy+P6VprdupsiqmBjUareDBv/fg+JCPAjkKFlKujsN0cZc0hR
         B3e3jlip0DNZ5BjOIObaKWNfTf1XWPt2vh4fWu7qBl4Mz1cQ+3kxdzOltuTZJGpi1iWy
         4KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325272; x=1768930072;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frju41CddkaBY4Kzofa1mx3Txjlx1h9nbA7zsFc4BMM=;
        b=JEngkxl5B51r6zsenh41cFLM/ubuk3sq940GU39kMJ/wEvfnIVifYCLECkpTABhB+q
         0OoVLdbpKbjPqEjuo/gMSln3EellmXWWmstnyXyXzpfS9DipBhC2IbV9jE1bbKspHkea
         k/58zedMtYZKLSdEsJQ3nAHtUaLTqC30y/F93j4RRi7CmSAeuMcbGoPMAIgtlGmsZYTu
         skza2+NAlsWqX6WC0ZrM+u1/RStqoG+Hq9eMLmPSQyCfARRulcsI/ijUnzplgGMA6ahu
         0Ntj6tBMyauhXLSncntmH7kJUFHulVN6ZcJBLyQ3SOhUHmfvz9+TPPI2C33BiAJ3Rlnf
         JpQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0pdOqZ4TWOYErPAaid3kxMSJqhCSnaIKA72Hk/zhmoasocFhSxTN31mQGaKLm83wK9hJ9g5XtRkxu@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCM3cwsojF8Y5kVDaCnzywExVeGVh+GA2h1wn0dgXYo/tc2aN
	NIdkPDC1rLzkNqaoHjSkUREJDOlp/gkl6RFVo7Em7AqpQQUrxBxzZLWqkmVpLmAirm4=
X-Gm-Gg: AY/fxX5PS4k2Rsi5iEiMnZB7QrcEVCa8MtVb/iy6PmQVidkP4BR/ZpoFSO+feJOMUp1
	xpzXKLaOfy/MLF/3JwFJksrGTr0EGdtwMsbzYpzFdnK7Y02bXuecpUUnqB7PU7KJ4lLFVhutp9i
	aluKxhOZAcViwghRbtN+Q5IKzAvVBZ1gdSm7ycN3A5FA9gZxkolBgYid6uIS7Vopmo7TQRGsztv
	QsdW2C52czTybu/IazDLrauBHTKLpZrg3pJDQsZ7NsxTIUzBVeZJ8tNGV0YjsP4DjyB/FKDm5rQ
	0NK44g5y7oDr52XtU1Btlm1ZceP5cq6TB0dfBAKKtlNYFHPhi2vBi4iRPzyCOvrsWCnnI3RnLnl
	68WZlqBEnpPXHwjk4OVkTvD19OTU/p+/XzaX88eg6Oofy8HCH3HukPc+dv/C+RhUXC9WjvpRhw4
	QOKDyypdQXXCV/D2MH
X-Google-Smtp-Source: AGHT+IG41cDPOQCdX3XgrEWI3F6tVAXs0IS7rlseRYjYEyKPvHunMkGKaXtqLwq05QF3FCKe9goC/w==
X-Received: by 2002:a05:6a20:2583:b0:366:14ac:e204 with SMTP id adf61e73a8af0-3898fa57649mr17093420637.66.1768325272156;
        Tue, 13 Jan 2026 09:27:52 -0800 (PST)
Received: from draszik.lan ([212.129.80.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f44a94e98sm5809433b3a.69.2026.01.13.09.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:27:51 -0800 (PST)
Message-ID: <4502ece1dc8e949e23f971a93dc06dab2d4f0bf7.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:28:20 +0000
In-Reply-To: <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260113112244.GE1902656@google.com>
	 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Mark, Lee,

On Tue, 2026-01-13 at 16:20 +0000, Mark Brown wrote:
> On Tue, Jan 13, 2026 at 11:22:44AM +0000, Lee Jones wrote:
>=20
> > MFD pieces look okay to me.
>=20
> > Once Mark provides his AB, I can merge the set.
>=20
> Given that the bulk of the series is regulator changes I'd been
> expecting to take it?

Just FYI:
1) I just noticed I have to rebase/resend this mainly due to
patch context of the binding updates.

2) this series depends on another MFD series of mine
https://lore.kernel.org/all/20260113-s5m-alarm-v3-0-855a19db1277@linaro.org=
/
(again only due to patch context) which is still pending.

I was under the (perhaps incorrect) impression that changes that touch
MFD always go via the MFD tree. I guess that's not the case. I'll update
the relevant phrasing in the cover letter with whatever you two decide :-)


Cheers,
Andre'


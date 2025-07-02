Return-Path: <linux-gpio+bounces-22613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CC3AF160A
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 14:48:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADE374E64D1
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3320D271446;
	Wed,  2 Jul 2025 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f4ygA4S7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401EB2367D3
	for <linux-gpio@vger.kernel.org>; Wed,  2 Jul 2025 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460475; cv=none; b=Pk/sBD68PuIItaJ+jm9OwkdD4Jq3KVNbFfN0qNtgjCCIxvhapzQYGgipIDKsSFSlk3l2vvKLS92CzZpHHtY4AA4QX2gTY5NgL5d9hP7tdjVwShm1bMnxTOLqPWDwxGkzC7/fY00rgy11ndAlkFRFYCQea95oOlNkUXXkeljylTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460475; c=relaxed/simple;
	bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urJ4oZ3+wjP3jK9I+VzdQugwdCWkYV0KwrnyqtPW7dkC/rGeCrCvvEwMgfzL+8jzkFzkx7AEW6VBvqRh0F2FcoyzRuIFroJrsgDljOcFLENvre3d2166b8k1vQi7Uho1FDxX3U9LYfrB211g49yMvBsjoKZsFFfkD72J+xD1xXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f4ygA4S7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so4074926f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Jul 2025 05:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751460471; x=1752065271; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=f4ygA4S7O3BHzHJbk+jkI4/OYzynoFH2b0ZjGyzLQHrIWgslFfvMS3gkAt+7dI602q
         gu6eSIZx8L2kXzwNeJuVNdXxijq2B0q3m+dy2LR/tMWbYepxAROBeq+kyipJHas3eWZC
         Hq606tXIWfU61HRjIxQ9ReFQC7ZVm3d/Qe0cRM3g+BRGAw/cYl6ZaSUEh4CiJ+y0kWFj
         I7V88Y8S6QTVFSfDFdF0sY+SULUsjseDoXegj86kSduNf59BLBQvYVA9kzkrGqWqzrIH
         F7BeROKIj1ihofOlOk1zML1zgiRxmSA72td+a2StTpQh5ujX9Vscz/ngUOXncEaoe9C6
         r7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460471; x=1752065271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5kYHzYmH2aRzXt6VPZN5ZJXDdGIJtTeIUx7G9Xqy9k=;
        b=UqSXIAH+bGBJdcSn09auZmarWLRX7am+OyFwn10ULFQJm8AlZQkLl50y+f8XNr7soc
         pxFGCLVw4ls7uYas4OjAiaRAgUQjxpyoJM4/RHTpTcBfwzn59uIInQs35NTgkA+fsgN3
         gDncMASyVmOnuVEIX0HL/sTnTdBG9LslA8lpGCQFnOpOgIE0CvEjB4vssrjz63DXXlFs
         FqqIv2hb+0qbsLkYkqfHLeVwydcGB03ZM+eOZ3JEgq4YqZeDDvN4yNXtKNdXFqelaPfS
         jMPJef++uT9Vwu7ycuwMbRr3+ZoiKFcOdUQiBcJfLUgf985XYsQ4XuDT4OFsV2DjZGk9
         WVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVtU8XTVXlGD38oH4C/9ID7K44f/YvhHQh3TopGjblgASfLagXTZxFycZODocJnBKmqxLT2Xbc8RPOj@vger.kernel.org
X-Gm-Message-State: AOJu0YzXZ+SOd2p1O75xEL9atCi4TRwKJgdUAOGdocT2vsLd4Q6V4XBa
	Yj96CxnnWcYUe+iyL5hbrhspCPHHmXLZh3pPjdrUIR01d4UyD4LLeqHFQREDjUlEbi4=
X-Gm-Gg: ASbGncuin6MhjPaobem1JoTiNAFtCo7CWG7JdkMyMGl3mxwUap9Kj0dR8pmhSmtyKzZ
	foG2x4Gtu8Vpbg4CxrUXJTmvUm2rgU9ANpYp453tjbBSUNM0HI/Qz4XSMmqqCJqmTEtIlj6+w/p
	QkScLdfeO/xt2pmL3Abz3sxiH+XsKQWe8RoO/fVq3dWDJRYOnHEbLtVumJAIElA/DZ0zpVd/aYc
	l8jImnOIEqPhoy4KvAXug3DyVRveSogvIRml6DzWTO9kz4yFADRWNrFTd3httHd1KlZA1jSBZNL
	Mi9mAXGfK+RnUeGkhI74x6Io5QAJHG25yXBRmSAvcMCuerx8EQT6IDxN4pnMmRFjpQ==
X-Google-Smtp-Source: AGHT+IGPeeUccLmCtgYtyYD+ZS1Aj6ZgB09U8/1PLF8w5rZHkBfzkakwgdj2Tll4vbsez2P7mMwNwA==
X-Received: by 2002:a05:6000:402a:b0:3a5:51a3:2ef5 with SMTP id ffacd0b85a97d-3b2015e22c7mr2056080f8f.58.1751460471460;
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b913esm223450335e9.33.2025.07.02.05.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:47:51 -0700 (PDT)
Message-ID: <c601dad05c9b8da4779af9c3ec852767e87dc9bc.camel@linaro.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix gs101 irq chip
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar
	 <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 02 Jul 2025 13:47:50 +0100
In-Reply-To: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
References: <20250702-fix-gs101-irqchip-v1-1-ccc84b44ad72@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 13:15 +0100, Peter Griffin wrote:
> When adding the dedicated gs101_wkup_irq_chip struct to support the eint
> wakeup mask the .eint_con, eint_mask and .eint_pend fields were missed. T=
he
> result is that irqs on gs101 for the buttons etc are broken.
>=20
> Reported-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> Fixes: 2642f55d44ce ("pinctrl: samsung: add support for gs101 wakeup mask=
 programming")
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Note: no Closes tag as issue was reported on private chat. Permission has
> been obtained for using the Reported-by tag.

Tested-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


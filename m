Return-Path: <linux-gpio+bounces-5342-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAA08A0CAA
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 11:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6661C2153B
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Apr 2024 09:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8280F145B06;
	Thu, 11 Apr 2024 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fwxOLmbY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3447D145334;
	Thu, 11 Apr 2024 09:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712828547; cv=none; b=jZzg+GrYihKcnUTS1/72biWJp0DLtOhTygr/+2Y/ossHruK+dzbcFZFGlHk9hK3Hmd/7Gc74k9nFyLdR6xuuqz8bBTNy+OIDgK7FQ18mNOwDPmBsJV90kRGpaoNtn9u/i8yOEGHMqrG6CXRsGkLbRYh4MxaOzsnqvs4GUiGpLyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712828547; c=relaxed/simple;
	bh=9zHVZHJr9OoCwdLqLrqqH2nk5Gz8ExpfR6tAR6WXenk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=LIhsVlSdm8fxI3CdNpKqIjziu2wHo8VJQe+XGHycCJY155q8/Q+ewUxczpMP7NWDG62po0ag8c5Qru4kp7uIfJBuCsefzhUgDR9KPS+pIcHzel/BzWfUVGMJbgnCbqTMxBYkYOLrHu6a8xSAoPwlIn07NjlBwL/2MgFi+NA4Dr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fwxOLmbY; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712828543;
	bh=9zHVZHJr9OoCwdLqLrqqH2nk5Gz8ExpfR6tAR6WXenk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=fwxOLmbY3pDnFANoxHetL2LJBjz1vc2t9cnWGaf/5hxq1+EGBUYr7NEzdvshA7a6Y
	 QSg/2IAPjeQr7mNUnZQklXvphAXPb9qCbxHGXcY+cvyk5X3ywBDvrp6u60yPPYCw8g
	 wxl8C7aBE9K6eYhe1uCBJLJ7gXUMKBjvIdtF1bzxDi0Py6w93tmmejKY4r+ypNbqlY
	 1v5mPj0Vw/OzHTxHllYQ0jUG6WfHIGUFmVKsi2jhg6h6N06+Ec3dyqNJ4Uxzehihcb
	 hygOeTdXO/j4T9HkT2pSgfrl09zfn1lWNXkz8jQ6A8nZV1XerQQLzK5GPVgNoPGE1D
	 qxfI4Ob+pnt5Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 006943780029;
	Thu, 11 Apr 2024 09:42:21 +0000 (UTC)
Message-ID: <26d097e6-8be1-438c-85af-9bc572b74770@collabora.com>
Date: Thu, 11 Apr 2024 11:42:21 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] pinctrl: qcom: sm7150: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240411064614.7409-1-krzk@kernel.org>
 <20240411064614.7409-4-krzk@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411064614.7409-4-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/04/24 08:46, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-gpio+bounces-14380-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E3F9FF129
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 19:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54B001882D29
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2024 18:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E961ACEBF;
	Tue, 31 Dec 2024 18:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IDDXN8+k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FC29415;
	Tue, 31 Dec 2024 18:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735668812; cv=none; b=LXAMrdW/sFlPSkLH9m7Fr4lt+Gl7FoIx74xbr7toicAnuaeeS9dL9rY2mWjFOv38BudtZcmbooCOt+5/pFNi4h54xGhivginl2zptCY90wdNGfxLgoTnMn23QpqihXll8zTfTjb7F8GLvtcvlpZS6As+PP7zVh800sACIOAg6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735668812; c=relaxed/simple;
	bh=jHJ3utLU0xnvbYebbGDtbahU+jft2h9Yvs8eauS4oKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jF+Y7SIEuowHsztvPpZ6D4MT/0AQJ5ywhnJxX9ZfNq5yppWLtIrgKuomPltLFORneKG8igbcm8+62c6USGDGUcPEXP9RQCLkcfcO0CEJMGwzueR3PCSEcqKASfKOZbSVNZ7bh3Ivys3ds5QvqJuqp7VbuYPaeuyTRs7OKl75QVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IDDXN8+k; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BD3F10486D96;
	Tue, 31 Dec 2024 19:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735668807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O403emxKNDKzcMRgQfG1GrGFTfNb9Kbfd9tbtbIZjU8=;
	b=IDDXN8+kYgCfloujJuN7vZyk2rAMWhueTEB92Izu88k+3JXQO61JBP7RJsUqVlEcIGSxAQ
	Nal2X6Tg5E6j4xwdygMX8nJFRIMsKh8peHnn7KWLmrloPLBVQ0X+iNV+9XXOn5XFvznoKX
	6dYp07rSeLGwlXgCc7i+MNpBxUTsukDTPudPMcOk1SW2beLfy/hQ/ADsSPgkW/2At1NkY9
	NLu/YTJjBOTA350sPAjw65Kpge4m1jAP9C4Yr2Ft7FNkOxeE4xwZiU/DS3MNZ6Y5ZFlsy1
	vL1lUOsPPk42nnPNwHvxbhkh4jhLEHA8LXvHA8ohwGSqgQhmArKA159PeJyU9Q==
Message-ID: <7e4f4613-441a-4489-837d-2b69f0364af0@denx.de>
Date: Tue, 31 Dec 2024 19:11:36 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241231042756.3166495-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241231042756.3166495-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 12/31/24 5:27 AM, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !


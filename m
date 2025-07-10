Return-Path: <linux-gpio+bounces-23085-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E8B002B7
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 14:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDC001883BE2
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 073A725DB0B;
	Thu, 10 Jul 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="hzJL1xtJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DvSyP+t1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2D206F27;
	Thu, 10 Jul 2025 12:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752152339; cv=none; b=qW+z81r7fhnJbNSakSsy7EEDiTFMxb1ZnPVqZsCNwanmPVfy9zQB/3QxffwQ/Fo5CLaMWI9dK+sM9myc/bZj40z3ggF/6NSK7Bqns42dwVHGmK41W3/NbbTXeLbNqUBmXPUv/sxX51vQQuaZrseMOnPGqBp+MoogrOEFwOPwtok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752152339; c=relaxed/simple;
	bh=KaOKgVdFL+irKfHLZ1OrF2/R9hakLs/vVkiHY6HzRAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMAsamh1zVJHXGV4a4zxgrvZFKQIAWKdhAV72sG1WhCnKlBMon3zp/g2wAaqZ7b6oz5MNi0SKLwr7tdlzHGaudKjJ+CqcqkbVy8OTt3uyMGs+fElaNOHjyiAgDHwNvepvoYNKZUlkhGSzSJk8YFAIqpnOz8LepwQbfgNEGUvsB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hzJL1xtJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DvSyP+t1; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id DC44CEC023A;
	Thu, 10 Jul 2025 08:58:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 10 Jul 2025 08:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752152335;
	 x=1752238735; bh=il8eonhKTAZA9tfDODVbMii9tJYel1jfdub1bKHHm2M=; b=
	hzJL1xtJd+D+6TXTB21oRkhb+mj12BoIV09MtrUj7TZVnU9C6RosTyPkn55ePtY0
	+sqJeXae82RrRV2BjcIp7SAV8Pawxw2W4/Tx7o3CC+WVPxIHbB0qd5LbrFdix80D
	Smg1dZPkILRkWoGo6f0sXMBStEy0jUE734/k0YLUebBkFpD5T0VyDJnJsdX901m2
	myPyvzZC5FNrBqYtSlJyAj/Htu+/0ZR/PdhABkCRQ2jWXWaRq9eJFrL9xVqZ8knO
	FKT+tT3IiAxeCmIgCDzZvWuGl1EwQxQiQUOYO6mXpp81xfzbRe4KntQNWW9Xqmbe
	byHpVZ8BN5EU33XcEt0QUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752152335; x=
	1752238735; bh=il8eonhKTAZA9tfDODVbMii9tJYel1jfdub1bKHHm2M=; b=D
	vSyP+t1opKAAtGi9yV+OV/nqeTKvfoTIvEXmRmKuFDpnc+1kQP7//ZHhLXWscc2q
	E4k7lKRipgoj5nTNxgmUNPLghL9mGJDthcVFxoNMZjs77g4bVXkqRe7uxy2EAigb
	OMWWgqLOjmt7K5Qa9/Y5WGfIRXKpDw7uJA58BjrGNR/l53RADNb78xkhwoF9plA1
	gXIMLkcNJ+/SCYRth32+FbNdmZe0tQIv+hpnAyHnOC/RFMMibFrKspYAfQWDHhC4
	iRBNTzQVGb5B9jQcfE5pGxQaaS23nCWHrUhjf9TcCBDsae9wDknq3iSyO/QRHYXd
	EDinlHVI/LSi2RxVRJOiw==
X-ME-Sender: <xms:D7lvaDVCKuYwOcVwYNebC_rfg4HI8Z17qYQ1mz6Wln8ZuusFtydTSQ>
    <xme:D7lvaMWdy1zR5v7UPRHdhknyZ6W6cH1_dTkXCj8AwvB41o9bTjSUkELAxCrTfmcNy
    HQ0meeU27-17Qjk7Yc>
X-ME-Received: <xmr:D7lvaLhJPUlElgCutZxt7JO2uQkz7ayvoAqN2GyeFaY7MJ87wRbdAcLY4nyvMoVl_uFd-UOJ-eQWNmZQUN743qnsE9rNGYNecA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrth
    gvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeehteeh
    keekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgr
    thgvtghhrdhsvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthho
    pehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdprhgtphhtthhopegsrh
    hglhessghguggvvhdrphhlpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:D7lvaPYp_NJmjGcKl0V3Bqok7vZcJ4ruiR4BrU3t2XWoMS46MobK8Q>
    <xmx:D7lvaArmpmSKxVAyWQPcVa9ys-C_YEXF64CMn0TXihvIlbzaEKqm5A>
    <xmx:D7lvaEPKOHaEbhRFtQOUqojqDHJlsbXeoWAgsVoLnv-9eKdoYcP0KA>
    <xmx:D7lvaLq-WXptoeNNoLriayuc9Dy4zJw8j6tYTmbxwvsoBNWLPqvCpw>
    <xmx:D7lvaL-fUgaaa6RKLaaZ3Y07Lj7UeOUiCf2etFQZk400Lg1JTnfZTYQM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jul 2025 08:58:54 -0400 (EDT)
Date: Thu, 10 Jul 2025 14:58:52 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>, linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250710125852.GB2234326@ragnatech.se>
References: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2025-07-09 20:43:59 +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car GPIO driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled, while increasing build coverage.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/gpio/gpio-rcar.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
> index 1d121a4275905e09..cd31580effa9037f 100644
> --- a/drivers/gpio/gpio-rcar.c
> +++ b/drivers/gpio/gpio-rcar.c
> @@ -592,7 +592,6 @@ static void gpio_rcar_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int gpio_rcar_suspend(struct device *dev)
>  {
>  	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
> @@ -651,16 +650,16 @@ static int gpio_rcar_resume(struct device *dev)
>  
>  	return 0;
>  }
> -#endif /* CONFIG_PM_SLEEP*/
>  
> -static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend,
> +				gpio_rcar_resume);
>  
>  static struct platform_driver gpio_rcar_device_driver = {
>  	.probe		= gpio_rcar_probe,
>  	.remove		= gpio_rcar_remove,
>  	.driver		= {
>  		.name	= "gpio_rcar",
> -		.pm     = &gpio_rcar_pm_ops,
> +		.pm     = pm_sleep_ptr(&gpio_rcar_pm_ops),
>  		.of_match_table = gpio_rcar_of_table,
>  	}
>  };
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund


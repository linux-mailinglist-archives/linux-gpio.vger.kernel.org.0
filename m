Return-Path: <linux-gpio+bounces-18690-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 129DCA85C57
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 13:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2310F3A370E
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Apr 2025 11:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23364298CAE;
	Fri, 11 Apr 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HIabQ4a3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D081DE3C7;
	Fri, 11 Apr 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372629; cv=none; b=QDehOBUiv4OtSLFcyKQrIMRXzMAskTGX/WInx9A5w0Uske+hWXbHvoj595V5kxTjmavA0Tmwr+8m2AJqv+JW6b2qwrHe2OP6UzpbZuyY1qqQCbsvjHmjcNI2yRXxN+XZiYN/uano8vf9ItYmtLbf3jUoTl8QX2aVBUR3+LorV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372629; c=relaxed/simple;
	bh=oIteQ/tvHzLSAAC/MB+HZxCV80HJ0PTZaCBMsYbAyFA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Ns4k5qdWFbjE1sS2CxRB1n3Y3djYHFW/0hwXXb7eRk+mso2cL0NityEq1FYM5zMP8Ji3rtszs6v9nw5SHZoOz+fol2ceKxX+WmqEglSLfEethNIGT54qiBxrPdN7rBm2U28NhDsMU7a5nXH5QelFo/O3wAdUc79RQmtmyK6zzng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HIabQ4a3; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40FF1443EE;
	Fri, 11 Apr 2025 11:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744372619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K145FFCIIAY8UZ52tUpZam9y5R7S/V4gSakdeIN5yGI=;
	b=HIabQ4a3XH+XJ1dIAooguguvh735/Vxb9YXk+7ytzMhP4jQqmDt/zQtjCaJIOg5c67Oz8+
	LENJdrfnDW3XM4+ah+ZZE/1lZ45cg96jks2WPCaZ7OWXopnW2V8s9tLV4HNKks/0XPJ5TW
	zOVLrRNEsRGSlG/2/1DleaTl36lvrA+IqM2G/wHnJlIG19yke+F9Tr2AMkmTar/2RxLfuH
	aqPy06FtRXe+e69aKG70w9AVuNebSK4gCSLcIDQccQ/E2nFlW+YrgRmUlrDLVX/Jr21XnT
	TDZ7lRETbwc3UEoJ4LcBprI1VTSH5ZUO0ThOqxjOZNyl8hinpE7ekHLdKScQRw==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 13:56:58 +0200
Message-Id: <D93SHIBVZQTE.1U2YFWQT253SW@bootlin.com>
Subject: Re: [PATCH] gpiolib: Allow to use setters with return value for
 output-only gpios
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250411-mdb-gpiolib-setters-fix-v1-1-dea302ab7440@bootlin.com>
 <CAMRc=MegvXZGAVA210rjnFuKZwg4appN4nAJNejfC2jpY0JLOg@mail.gmail.com>
In-Reply-To: <CAMRc=MegvXZGAVA210rjnFuKZwg4appN4nAJNejfC2jpY0JLOg@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddujeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkufevhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekhfekieeftefhjeetveefudehuddvvdeuvddvudfgfffhveekffethfeuffdtudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmegsvgejudemkeeftdgumehfkegvvgemfeegugdunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmegsvgejudemkeeftdgumehfkegvvgemfeegugdupdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com

On Fri Apr 11, 2025 at 1:38 PM CEST, Bartosz Golaszewski wrote:
> On Fri, Apr 11, 2025 at 12:31=E2=80=AFPM Mathieu Dubois-Briand
> <mathieu.dubois-briand@bootlin.com> wrote:
>>
>> The gpiod_direction_output_raw_commit() function checks if any setter
>> callback is present before doing anything. As the new GPIO setters with
>> return values were introduced, make this check also succeed if one is
>> present.
>>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> ---
>>  drivers/gpio/gpiolib.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index b8197502a5ac..cd4fecbb41f2 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -2879,7 +2879,7 @@ static int gpiod_direction_output_raw_commit(struc=
t gpio_desc *desc, int value)
>>          * output-only, but if there is then not even a .set() operation=
 it
>>          * is pretty tricky to drive the output line.
>>          */
>> -       if (!guard.gc->set && !guard.gc->direction_output) {
>> +       if (!guard.gc->set && !guard.gc->set_rv && !guard.gc->direction_=
output) {
>>                 gpiod_warn(desc,
>>                            "%s: missing set() and direction_output() ope=
rations\n",
>>                            __func__);
>>
>> ---
>> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
>> change-id: 20250411-mdb-gpiolib-setters-fix-b87976992070
>>
>> Best regards,
>> --
>> Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>>
>
> Ah good catch. Since the culprit is already in mainline, would you
> mind resending with Cc: stable and Fixes: tags?
>
> Bart

Thanks, I had a doubt about stable, as I believe this only reached rc1
so far. I will send a new version a bit later today.

Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



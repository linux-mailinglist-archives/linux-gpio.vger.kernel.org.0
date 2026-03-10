Return-Path: <linux-gpio+bounces-32878-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DghCMq3r2mKbwIAu9opvQ
	(envelope-from <linux-gpio+bounces-32878-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 07:18:50 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD68245C80
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 07:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD274303B165
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Mar 2026 06:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0152E285C;
	Tue, 10 Mar 2026 06:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAgVhH6+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A78F31D726
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123518; cv=none; b=PjcfVbZa7zmtf+LjqE9ZOSMkX7xzcQVOemAI81x46btXw8Yvik0Ag6Suhtr4RAVS2eMTXQa+61H79xZpn6+Hzqf1hxtT5WHLW3xJuCgixb/b6f78GXUo+k2fwF+wQY13OgCiVXqBgxlu/8FjtndhQdU/QHYgp0iq6LRAhi3iKNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123518; c=relaxed/simple;
	bh=VlgOLU/SAL8F0zd+At1U9RW8a1ngZacbFmBgI40qeF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMjaph/JkMmd11d3Q02Cv2yjjruTrmmt36JMS6z6gFqH3wm88URfuBuA81meymmXJPM4y/gnr57IDIDaJq72VSxKrFQdfFRKxWN2Db3goA5L1hYkfIBrS41lZ1LSeqSybEdEv4HvrvM2nlNtZtHD6BI6hDRgnEbsg67uK45rvB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAgVhH6+; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b4520f6b32so15017887eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Mar 2026 23:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773123517; x=1773728317; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjtQZnmo8Gwc+dKRjcrzPdJaL+KCrJVCb46smQt/ILU=;
        b=UAgVhH6+2GarzBsrOc8PA8/PZu7drUyKWT3wijPecI1XHM9hH1Y9DP+kZKSke2LnMC
         yY1yOHcX4mlkHHfZEobjK5g+6QLVV4fqkpq4OxlP9ti1Yj9sPeJ4i2Xoa1uatL/kG9he
         eci7vzkhykTu/G8yCkPzEiOFITJttNWAMy0qcbIF4Uo/cY0NfGvg4GfYmfiiY9rLvBO2
         K8faDuKDsoHAdhbHDFECN3hvynrSTx9Nn5gMCP6MSj11uK0xkZUPexJlTbRJtPGqm42K
         bg2aDyxPx/NEYTfdYowe97fd6BijtxcrhuwA1vhOxhBCDWVG/Cuu7Q+Q6KnXpPixhHVI
         f5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773123517; x=1773728317;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjtQZnmo8Gwc+dKRjcrzPdJaL+KCrJVCb46smQt/ILU=;
        b=chxo2wd/EbmqtdfQMYjkBYfUQINAauWPaGdikCvmfIru/6UholiU+/qnT1olcfHweo
         klPJLfkPryUQAABuJx5AEBrka1htKKcc+bTcAnvMkMdJ0Zpabh5WJQ+e7L+2IWbA9RN8
         ckzR6bWV2DckV0z/3N/sWxX5T3fttIz5J7DAUpRK3XtH4O0CZ3KCld+NVPItqMH18+Po
         H1VWso/5r52vrx4cHh/d86a9Ir78DMnNH2KoUgP49ZpDPHhwq88g1vRCkPTb/7WxHwe8
         gmh7ao4qRpkDUqynfbSqjzFoXDZcDB3hpYpAUql0qLm8Xa9+yDTh2rC7dQSBIdKfzwCf
         4J7w==
X-Forwarded-Encrypted: i=1; AJvYcCXpfvUxKis+ZJn+sarLThZ3javgYgaJKk95amovriE79Wi+E7N7+sQV5MRlf5fzDYB5Z6efB4zOL5df@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90jMQajBmmRyBy+wi1WBRX4fF2s20DwQGnqvxLVvemxgLWMVP
	QpuihR5I53mgHaDIwERfbDvgkTQudHuTLhtAbkfQouWjKujMc28QjhEs
X-Gm-Gg: ATEYQzwZTVT7iY8hnR4uAY0dnRdbc+ussjgVgBqQy3dbmo1ih9kjLzBhTdH4r7klFlx
	ZYQfXINuLjcZM6ihlNuK46kVbNYkUhggT/C/ur7x+RfjJ/8dp2FBK/jYpV643v0RCFfPJQOR2B8
	ThRWcZTj1BgvAFuigX5VMOpOrO7xNKATBuUoQOqQzuHwytQZ+JXgPYtGcERjKDHj3LaQhK8VKUC
	7i+jAhCGC6zaME++EF5CeUDfNPGROjSPmnsIaeotP3wtPrPXdg0hSj2LD6sY98fTdZdJ7ZIhe2F
	CDog94nAur98hO24MI4iqTzfSi3biL2wkHbaqUupE3iOPV4z4QKTl5IeYkrPTJyBrKdeb0aykCF
	zzhWl3ZFJfsoyWBecj2OcZZJ9VYBR4P7R9at85t659HOShwZ0M4sfvN3MMqSbach4QhSIVOvs1l
	fR4JNW4Ac2KD22StV5ms9LpIzNoVno++nku56PreEwe91zz/D9o6DE+zn+wYeSoW/qv4YWJcaU3
	ao=
X-Received: by 2002:a05:7300:1489:b0:2b8:6ae5:79c3 with SMTP id 5a478bee46e88-2be4e090105mr5356857eec.38.1773123516637;
        Mon, 09 Mar 2026 23:18:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2a0a:17c2:21e7:dcfb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984cf5sm13202342eec.33.2026.03.09.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 23:18:35 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:18:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: normalize return value of
 gpio_get
Message-ID: <aa-3e_Wjh5J5XFi3@google.com>
References: <aZYn_xDxBXn_Ijem@google.com>
 <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d561d59-1691-fcd0-868c-fc44db1dac92@linux.intel.com>
X-Rspamd-Queue-Id: 8CD68245C80
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32878-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:11:10PM +0200, Ilpo Järvinen wrote:
> On Wed, 18 Feb 2026, Dmitry Torokhov wrote:
> 
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by p50_gpio_get() is normalized
> > to the [0, 1] range.
> > 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/platform/x86/barco-p50-gpio.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> > index 6f13e81f98fb..360ffd8505d6 100644
> > --- a/drivers/platform/x86/barco-p50-gpio.c
> > +++ b/drivers/platform/x86/barco-p50-gpio.c
> > @@ -275,8 +275,11 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
> >  	mutex_lock(&p50->lock);
> >  
> >  	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> > -	if (ret == 0)
> > +	if (ret == 0) {
> >  		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> > +		if (ret >= 0)
> > +			ret = !!ret;
> > +	}
> >  
> >  	mutex_unlock(&p50->lock);
> 
> A simpler flow would be preferrable over all that nesting. Is this 
> logically correct:
> 
> 	guard(mutex)(p50->lock);
> 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> 	if (ret < 0)
> 		return ret;
> 
> 	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> 	if (ret < 0)
> 		return ret;
> 
> 	return !!ret;

Yes, but I wanted to minimize the amount of change. Maybe I should send
a followup patch converting to guard()?

Thanks.

-- 
Dmitry


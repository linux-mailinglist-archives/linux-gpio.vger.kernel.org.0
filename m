Return-Path: <linux-gpio+bounces-31801-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGcDIFn0lWlTWwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31801-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 18:18:17 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B015833D
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 18:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A83843033F81
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Feb 2026 17:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA83F23909C;
	Wed, 18 Feb 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ife33ZHP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EFB18DB0D
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434935; cv=none; b=bFJGVck5d429ZiFKEuR97h1hDo58Q1qfvKorePmRpq/iwTaV5Bz79YNaND/Pus2sTkB8+UmEQrefibo66uF9YKqGXU+LUuXnmM0LI8ZZKg6/Y9EAIAvhFEHZtAPVldzNuK4M72wd+Gtha18XYb7EELqqSAkKD0SISjzov9oYO7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434935; c=relaxed/simple;
	bh=Q9ooPQVTGTcVJezfW6R+eFguPYeeOCmuofwhzMEcloE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jjsGkvObX8U/GQG3xqknamc0o3+58TsDf0VopoTC79vaXEZ546hlCC5IU6+0TYLgrmn0OiUA+8mx7oc0lY698eIMPscc3LorcjfcgqPq948r2/m/stofk0LKFmRpNhM4g48pe3YVHdBPNGGdlzt8e8s+iZWDrs2X3owGT0PiHm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ife33ZHP; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-126ea4b77adso6906622c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 09:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771434934; x=1772039734; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wIZQJcadFJwIiNdmilqedpFYEso+tQwK1rGzbwDAdbY=;
        b=ife33ZHPkD5m6DKy6IHlzY9LB4JkX/vc+CGk/BdG+1z4XKhv+Ta6JFhZ0mIQ6SPATX
         TIyX2xJd4QxE/ttpq9cYQxcIuc0dHog0aDs98nsR2TI1Ed7WX0x0mmKo0MI/lbCAWGAJ
         KINGMvdAt24qla8ESYnnc1NDRljOjYZKQaN6qWa/7k51WxBr349x/e/kdWcVf1ApKho5
         QQ2g6nQMxOFp3Nq0QtWdsCzG3MvSkfKHGDmTWjtY1bfHcO82BKbd/eGlv5s7XVJ87es1
         kLh5IKpkc5m1z5juTHcQlbnSiElAYOW+Kgbum96jiMDakDSTjhbeSIsV5C/fK0uMZJ5S
         dYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771434934; x=1772039734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIZQJcadFJwIiNdmilqedpFYEso+tQwK1rGzbwDAdbY=;
        b=MEcWhTehs5xIqxCrCXQtVhzKq3JNzlYu2yTtXrLK5iYrNNHrapgf6tSMCDNE9X+Sch
         UkqVLY9WiTPpWrFtp39HaQbuf/3VSviIB56HWQzx8Hw+q7mH0JUq8LrP7klgQyoMtOcr
         OTa7Mnos+ZHZHWHYoq+qIbRKxXEhCrQ9SoZqhJl0qNTIPK1fyC7koK+g6l7r3CjgtlyZ
         bYbwFVZ8nMuXPf7Hj/Vo4hPnAEOviJb2/3ZslQ1H1QT7JK4y24NwadmQzIbCk1FrTznT
         XixLt7V91IYva81soNoYI4waM1RsolJDSuf+mDQzH7xhqRCll9Ueepl3PlncVuJqf+mx
         HcLA==
X-Forwarded-Encrypted: i=1; AJvYcCXlwr0jcvcaawar6bff/yQSZiAl0zJkwPDNYFIa+XZR4G2VZMHUYMaJkjfDjgFPGX1rl6y8Yc9Fos3J@vger.kernel.org
X-Gm-Message-State: AOJu0YzoOVM0V4//E94hOdi+s8u9F86vN2QQaepancDdbNvb/UEMDqdm
	mKYSnmh5mRXhF1PRb+BJtPqHgQUAfSjo8ddpWYUNg2TGuVoVSu5xIJdz
X-Gm-Gg: AZuq6aLN4qa24MXtk2Sbjpj+DfBJpzZI+iTVmfKaNUUptF81aPaqt/pp6/+CofKqddo
	xkoKfbMzO6bbLb4MLSlYESvN+Fs98VlNPpCh8CaYhxymej+IqaiQyJfSMAwcRUM+b4hWuA4sBlA
	QzTrodtYfsXCa1glf30/1DkknydOl0gRjaZG0xEw3ovCNCpY783uReRwh7IPBIDUlp3ayV2Qm0k
	AqTAnsYyImPN54VK9tEVlu71i2gGE6p/RNQXOf81CmwYo6sZ9Z/BolhvFTgeZBxW2Yiza5iv+OE
	9FfeP9Tl7l7JYr77zI7O9DN4Jw1cmHrT5EIILBDoRF+IhUTYF7ajexsJza++vWfwOVkxhIE5T40
	lR0a4wWffhItbKmKMATBgF6GctLq/6rQ/p+mheJ9HH5GLdx2jWrQA/lypCFtkP16uLA9XGb+O+7
	wgqmSx156GvePpKQnSUoYKSCVttwE2vWsbKxq7nhaiwkTfIUJsfu1RnLhfwvGkMI9o
X-Received: by 2002:a05:7022:60b:b0:11b:9386:a37d with SMTP id a92af1059eb24-127398466d9mr5205084c88.44.1771434932895;
        Wed, 18 Feb 2026 09:15:32 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb5622f2sm22285550eec.10.2026.02.18.09.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 09:15:32 -0800 (PST)
Date: Wed, 18 Feb 2026 09:15:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: swnode: restore the
 swnode-name-against-chip-label matching
Message-ID: <aZXyPjIjIDKCBLvs@google.com>
References: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
 <aZUIFiOYt6GOlDQx@google.com>
 <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Md_x+DxmW742HRUW-jeg9_AW-stKkHUP9z13+M+POd4Tw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31801-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,intel.com:email]
X-Rspamd-Queue-Id: CF5B015833D
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 09:42:28AM +0100, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 1:31 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Wed, Feb 11, 2026 at 09:53:13AM +0100, Bartosz Golaszewski wrote:
> > > Using the remote firmware node for software node lookup is the right
> > > thing to do. The GPIO controller we want to resolve should have the
> > > software node we scooped out of the reference attached to it. However,
> > > there are existing users who abuse the software node API by creating
> > > dummy swnodes whose name is set to the expected label string of the GPIO
> > > controller whose pins they want to control and use them in their local
> > > swnode references as GPIO properties.
> > >
> > > This used to work when we compared the software node's name to the
> > > chip's label. When we switched to using a real fwnode lookup, these
> > > users broke down because the firmware nodes in question were never
> > > attached to the controllers they were looking for.
> > >
> > > Restore the label matching as a fallback to fix the broken users but add
> > > a big FIXME urging for a better solution.
> > >
> > > Cc: stable@vger.kernel.org # v6.18, v6.19
> > > Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
> > > Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> > > Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > > Changes in v2:
> > > - check if gdev_node and gdev_node->name are not NULL before trying to
> > >   match the label (Hans & Dan)
> > > - use the right link
> > > - collect tags
> > >
> > >  drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> > > index 21478b45c127d..0d7f3f09a0b4b 100644
> > > --- a/drivers/gpio/gpiolib-swnode.c
> > > +++ b/drivers/gpio/gpiolib-swnode.c
> > > @@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
> > >
> > >  fwnode_lookup:
> > >       gdev = gpio_device_find_by_fwnode(fwnode);
> >
> > By the way, should we extend gpio_device_find_by_fwnode() to use both
> > primary and secondary nodes?
> >
> 
> That's already done on a higher lever for all fwnodes in gpiod_fwnode_lookup().

How exactly? I am not talking about checking secondary node for the
fwnode that is used in the reference, I am talking about secondary
fwnode that might be assigned to the gpio chip and you need to check
both primary and secondary if they match with the fwnode that you call
gpio_device_find_by_fwnode() with.

Thanks.

-- 
Dmitry


Return-Path: <linux-gpio+bounces-30877-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B40Ji8TcWlEcgAAu9opvQ
	(envelope-from <linux-gpio+bounces-30877-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 18:55:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D66C5AD26
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 18:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32D44B0EF95
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Jan 2026 17:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863E6449EC7;
	Wed, 21 Jan 2026 17:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkJvs9cw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A3F427A10
	for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769016483; cv=none; b=hNzL32TNNC2b1usLDyhpJEIZPtY2tSdVr1LzlrYmehWti28D1mfFaYVyCn8S4aflzzc6gS3oiFKOC/AGtwAKrUeG2Ky1d4RJBYde+L68KcGa50SqsBsmwtSjbXXtEH/9L751RYWiss1dPWde0zcNXVar/sdoSPBoqkAIKl+Im8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769016483; c=relaxed/simple;
	bh=m5FI3xNAl3TkzNTKrHI4D59YqGJiqS+5075l9UsrcqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdUfXiWgIwEKTjg01rnqr/q5t6p3UZ1pucLWPHf0vosZZCQr/FHRJWgejTcgFU84zdoJCFqFA0+MnwLNGnvl0FPP3cvsv5Rr/Dx53TE9/o3GNwpkojk4ZrLTep61BJtUshRO2cgzfWJNzjaK+/E3PlJYrD0W8ljPXJ7TWOHPdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkJvs9cw; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b6f85470b6so69963eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Jan 2026 09:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769016480; x=1769621280; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ODmaEKD4YMc3t8iZSxwisxxhGoFljo8Y2PJTisCWGWc=;
        b=AkJvs9cw/nGdJx6MZgd1w2JMH42K2y/5SikPPxq0BP0UhZeAAqXT+CAGcEpjX/1top
         H4yKflgKcTo86GRxQslhDiu4xjQQY/zBMWLGMe4uv7R8aatcjDZW+smb4fS3sMMeWSOh
         snID/Kemy81qRl0IO6kJUBcmTDV0snHv62LDZ7vTLZZmCUHp323hNMOK6TkhzvIIo9tM
         K28bA0rDOW/CaJLagtqslK3MsgwWicK3od82ATnRn7ECfcGf6GHZmwmP5RLoy9Lxo340
         jtgdWUKO35DsVQbmUTl0IcHEd2jbYBt/+NBXYH95dM7qny5KxOToTFoj2dlg2A70rP/r
         eHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769016480; x=1769621280;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ODmaEKD4YMc3t8iZSxwisxxhGoFljo8Y2PJTisCWGWc=;
        b=aUW4BT2WjXS45+25k4lzm5yLIIjCvAVso30+t+TFHPM/Xlvc+6h3VqqQD16QAOz38F
         2QqfoZYNlF8IcCFZYlfuR4u1/9gbWdENG9n6/fA9jbrKKy5GkLYuPC50tit4rjCl52Zw
         vKVWv/QYw56gswdBy7TZlM+DxPkLoOQTU1LSAx/HCWqSYx7R+x75Ezyu19riL94qEyAJ
         ButfuhYhmyNKsWrMD0tee8cuInFn+KDyI9vtt5ZYGg5XWrcjFYBa+2+fieormUwMAqA4
         aEgOFj4sileiFSeid7BQSco0WK6bR1yY6f3o+vXEcXhsiXkqiI1Fwucs61wyxYQ55U6I
         DLJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLjsNkePbM2lml7exNS9dcQ8xwMyAG9CrpycCniX89UXhKE2JCSIN9cc+4XzqjsuWcfyuNI47s7XMi@vger.kernel.org
X-Gm-Message-State: AOJu0YytbfNKhC47LKG9UX1T1hjXbWz3f+T6qYjYDw1TSJzsPkAIJGur
	WSpzvyh00Y10iqstykkzG1upBuNubLeyj6q/xA5sVCwxurUjM//Q0/Xo
X-Gm-Gg: AZuq6aI7gCoa+2IP/LshHwoOGm48HT9Dfggc2EYFiuceRJiCYgveS2MkoqHrQjXLv6w
	eUl6Krs1qBlKNFTb0+QEQKE0yGF8qVlHXQeFJW4USmIbYGf7X6ga+IOqTht+rrppqtlvPKUlGIi
	Hsye4sgPDK4ja9610yeATXe8A767GLXXpdcasLHJG0V7f9YcNmeHiAjO3W9xl0PCHe9tXRyetIe
	0iyDgT9cRwDwZwy7yM3iKe42CX5tfQW7KAsbzKHH/qQ+ZykgE/FKd7hnwHkHErHeOtaSSwcgbdZ
	UIXDKUz8VgvGWPoAXNUryAivAaBQiS1AEw82UvPryOhZs8xmlTGhyCOZpKfimw802M+m6UyzhZE
	8MwAT23x2lNXcIR+w3toWEVtqgJIxrCzPHHM23A3hB0AlJstBCUGGR3lkdes8+x8ZjdsoBXngsH
	bGKzimDkGqrAkJNitPQLVz3qbt/BW+byeq3NiGgqMMux5OF32BMAH5UNMdB0hkkoU=
X-Received: by 2002:a05:7300:1892:b0:2ae:5b54:523e with SMTP id 5a478bee46e88-2b6fddb1837mr3771158eec.40.1769016480404;
        Wed, 21 Jan 2026 09:28:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:abb8:3a31:328a:3594])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b70a036d02sm5292666eec.14.2026.01.21.09.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 09:27:59 -0800 (PST)
Date: Wed, 21 Jan 2026 09:27:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: 756271518@qq.com, brgl@kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] Add common hall sensor drivers
Message-ID: <wv75wb5bif67u3yzbgbmrfg75zseamfvehewwyl4xnm3ecmqrj@5yqkwsrdlfzg>
References: <tencent_3AC818B2FE367BA7DD8940E08827CB146806@qq.com>
 <CAD++jLnSXPhqnTie9U03B7mn2x9ogUpABBLFwbt9dgtzdb3yNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnSXPhqnTie9U03B7mn2x9ogUpABBLFwbt9dgtzdb3yNQ@mail.gmail.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-30877-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[qq.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.145:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qq.com:email]
X-Rspamd-Queue-Id: 0D66C5AD26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:43:01PM +0100, Linus Walleij wrote:
> Hi Xuchen,
> 
> thanks for your patch!
> 
> On Wed, Jan 21, 2026 at 9:59 AM <756271518@qq.com> wrote:
> 
> > From: xuchen <756271518@qq.com>
> >
> > This patch adds support for common hall sensor ICs used in Qualcomm
> > reference designs. The driver handles both rising and falling edges
> > to detect magnetic field changes.
> >
> > Signed-off-by: xuchen <756271518@qq.com>
> 
> Why are you going to such lengths to create this driver?
> 
> What people do is usually just create a GPIO "key" input
> for the hall sensor, for example:
> 
>         gpio_keys {
>                 compatible = "gpio-keys";
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 vdd-supply = <&ab8500_ldo_aux1_reg>;
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&hall_tvk_mode>;
> 
>                 button@145 {
>                         /* Hall sensor */
>                         gpios = <&gpio4 17 GPIO_ACTIVE_HIGH>;
>                         linux,code = <0>; /* SW_LID */
>                         label = "HED54XXU11 Hall Effect Sensor";
>                 };
>         };
> 
> This turns the GPIO line into a "lid switch" which is what you want,
> and already supports regulators and pin control out of the box if
> you need them too. (The VDD and pin control properties are optional.)

Right, we do not need a custom driver for that (especially one using
legacy APIs and custom event codes and defining special classes).

Thanks.

-- 
Dmitry


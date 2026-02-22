Return-Path: <linux-gpio+bounces-31998-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEfECLxzm2kizwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31998-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:23:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3C017069A
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 22:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F07BD3008C2C
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Feb 2026 21:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D8235B633;
	Sun, 22 Feb 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5tF5D/k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D357123BF83
	for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 21:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771795382; cv=none; b=UtSUA8MxIsRT8AJt7vRJn3UeEKb5Vn+bc17+1R+Qgj3dlzoS7Wu9W6QSNuuZH5b8wpNzffyZxdTKnm5ayvweDjfOtmyVwMzwy/WizClSaOWBHnERVAFdJX8jAFrZWxpsjLAO8RpLG04lBCANWeejtADLrKgXKHfdaETwLUQrXU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771795382; c=relaxed/simple;
	bh=WCdEEysCfFHilfIMREfv0nttIGQIFkVVAYeoZz7ZyS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOYRFPi3xZKeZ4KFVS2ZZCIx1oanc0KwAhhDr0xFP9LPdIF1Zpp2kfw32U5pkYIK6Y/FszQ8iAKmHd3ub11WqLrhJOJ6Ps5fCPiCNPbn/vq2+KDFfTprmCoauhK3HPfNcOioocSCuvbPTvP0zCK3PrUEg36mDjmsI3J4WPLWaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5tF5D/k; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba94dbf739so3927706eec.1
        for <linux-gpio@vger.kernel.org>; Sun, 22 Feb 2026 13:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771795381; x=1772400181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ldEryRDzDm8Q81a/Tw1YqMlSWTl4WRirEf7oJhSEzuY=;
        b=A5tF5D/knlBfb1INnzDUt4+CluwwHjucP+EC72xFpPDlIMyxfTrjIcYtiULjEI9aCJ
         F0MGouxBlk6CTr9SyxqsGPh6UJquwr5x4WuZp1pRKU2/IaU/b8mU89uBmbxeTbs1V47i
         5V/32AmERS64cYiLlH4UKBxbS82QyCl/TMC2bEBWaKhcNQJZPMOtOalGlKThQQUYiMk/
         PDPSxPXTlZK3Zn7s8Qm8jTgmtXwHBhaAwaJD5Zm4Q4htbYM/MQ/mqxHFov9nKWT0yRSE
         WF9wBjOwFq0mT8JM2gWQnGz6A8JwrFk18cVVbbsMVSD70DkIivvgBR4zKxfhcJEW1pMo
         t7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771795381; x=1772400181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldEryRDzDm8Q81a/Tw1YqMlSWTl4WRirEf7oJhSEzuY=;
        b=JrGuf/1Oafo27v2BWxTM2z4LRiwSZi66Su+mqifptXyVTS5y5TU7TJ33J8s4EFHxlQ
         qy1CuXVkgPiqIX6XlPhtznJcBD6hXgbKpJ+kAcQdyrDyKfr7O8/29IFUKxrCLd2ueElS
         wNwP4RaHbcvEYWx8lEAvAMsTASLuxo+oOfQSLSf6uzJhanBLj7s/5c+MOQoGYKN6PdEp
         iSdA/mVi8FpqQq0rHDsFFpsRLYBp1QDUARQrwgJuyIna1Hqt5PGY0eKP9kzPLBVNEeGP
         EVaP7mYRK+Ix61BP0n1TW3VrHvF6YjACUVkITBtOTndK8gKWqWMPqvBp5AcwdaCmwyBj
         naqA==
X-Forwarded-Encrypted: i=1; AJvYcCVwXL6on+sAGVOyRFL4tYBFK3stGZ30TprvdbokLW5Ha5UcPFDxTN+nJ81N+5ldb2Tf5X9HweMdP2qd@vger.kernel.org
X-Gm-Message-State: AOJu0YxJpB/nwB7GZFzEgfRI5cpIJniAXpl554zqhXm6/uCUynCfgPws
	WnUjTCqn0YNVMQUxtJZEwzGGmlioqK1YlPGMEM3Rm13by7KeiOS+1AqZ
X-Gm-Gg: AZuq6aLUX7gWxZ0KyIONEnZGIIkvxU0R4+db0sCHAbNLzRu1zkGqBLKCdpnvTzhrxKI
	nLLAs9WIJqxrFUDH+0LqoBfUeNNAFNhsgvOkYvqPKuEK57TKxF+hR3furdn5KLOMezUyu4JnY0s
	AI9ehRH/Bemd2NUm/AYPzNXP64th6XTHv/hyTXPdKOLuZMxdB++A33LgyOiSMEyEbvKhP3mpu0H
	kMrc1C6B0Is224kxU98ayuDLIeBWlQr9oBdvkHHWTqMAb4oYzlBiiA/1L600ZZGrY5d/RCdqGdS
	KUsRdxzDRzzMv3APIT6yp2h65tqFw1AMeX0DqqjyJmk6oSxxTHPyFq0faFYekYYKa03YPGPbtsF
	Sv3sooyxiV3ru+t8hQJZ+emvNhw9BQ0JXGcLqNAiIHRljC0gU1mtLzlvpyquPSjbn9GCHn5nLtE
	RzYygrO5bdqToTvEFKio+TSrgtF2KUEK2pXIw2c9ZWmpyzGcOOULpIab2cttJSRKA=
X-Received: by 2002:a05:7300:6144:b0:2ba:8961:e1a1 with SMTP id 5a478bee46e88-2bd7bd0470amr3213309eec.22.1771795380867;
        Sun, 22 Feb 2026 13:23:00 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c6c:6cca:170e:c77b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc16203sm3727038eec.27.2026.02.22.13.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 13:23:00 -0800 (PST)
Date: Sun, 22 Feb 2026 13:22:57 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] iio: adc: ti-ads7950: normalize return value of
 gpio_get
Message-ID: <aZtznp8ZuALzC9N2@google.com>
References: <20260219022929.3558081-1-dmitry.torokhov@gmail.com>
 <20260219022929.3558081-2-dmitry.torokhov@gmail.com>
 <20260222140315.33e5e97c@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222140315.33e5e97c@jic23-huawei>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-31998-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB3C017069A
X-Rspamd-Action: no action

On Sun, Feb 22, 2026 at 02:03:15PM +0000, Jonathan Cameron wrote:
> On Wed, 18 Feb 2026 18:29:25 -0800
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > The GPIO get callback is expected to return 0 or 1 (or a negative error
> > code). Ensure that the value returned by ti_ads7950_get() for output
> > pins is normalized to the [0, 1] range.
> Fixes?  I'm not quite sure with something that says 'expected'

Will add a tag.

Thanks.

-- 
Dmitry


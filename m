Return-Path: <linux-gpio+bounces-36107-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJqrIA86+Wm46wIAu9opvQ
	(envelope-from <linux-gpio+bounces-36107-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 02:30:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6734C566E
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 02:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0447303204D
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 00:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868082744F;
	Tue,  5 May 2026 00:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="km7aIOwv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4E727AC57
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 00:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777940764; cv=none; b=a1dKMmowupuStE7GnEJD7eXfdXiIXwhzLWceFUhSBETn87gqQLBAgEu3k3aBxvhAGzya3UqcyUf58se4vpFmFoMdnmnzjR8uZTzMqVVd+ZyQvKNHTiefXAJICGitTKsyKsOzveJil3gJg5TCKZVyD0NjIuMDUadvXDgcKi9oYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777940764; c=relaxed/simple;
	bh=X115XF/LafrmdkHmbl4MoI4m0/kJFbRUnh/JSEI0EkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbIhPejZgw0r1IwjLZvae1Ob7rA2ojUO6YTNkP3iOMz05zhWRLs79ZJmY8ybkcAXCOJbrneENSVL/9XR6Rrj5Xtggwt3ntr4Wf1oWxXW1OziRNfsUHDKZTX+OvRF0ORiCDtFT6DPeqWLPiR2B9RZHsVYliVawKftKQ0wXgTXJqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=km7aIOwv; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ef84d016d9so6845149eec.0
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 17:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777940762; x=1778545562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eykFpQgFUZeLAatgtqrYUzE0cfRpZQld9KUP5h9cwA8=;
        b=km7aIOwvRJimuODyh8v8ZmY8xSZxrYE41COs/OoPIOi45iHzd0PLl9zAsmynqGob0b
         JB4L6vX13g2ZtEeaKw8G5OIexWorBWgpniOEW25i3rEbj2+zkV13Dx2M66XNaX0fephf
         I95P2pFjXZe74pIkzz1HJZX3EPtqJ2bPWrTIX7ev1XocqyYWAP/1LrLXZL2i8CDymDZn
         hfr9EOx3iGfthaxcNRcBYgtOXXsbSPZl0dMnOlAGjmTGLRcXe4uVu8XbcUYT7up4aE3I
         WHe3y9zYhG0ZwiR3ZVu4jVuWpokAwUAvZNRc3/8XDYCrtADPFb9AtSAeqe8VH+MJUuOC
         YJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777940762; x=1778545562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eykFpQgFUZeLAatgtqrYUzE0cfRpZQld9KUP5h9cwA8=;
        b=b3DxS6Uh56khtEyzZAqHPDRrplakqPw2ef2+0Mh8lX+c+bmb4gY0y4swf4ud5greqq
         u1Q/zk7cVGq2dU6aKPqOhxkLkotTCSOyG11D4R8yMXoOzo1kyY3DgG14qaJDJcVIgSFp
         OJLJe63eC5lDg35KE2cVz9knMizXic++jfcGUBrCBqdwrsH3o6qunhiC/JMr6TCcba6L
         ZzcR8JvQNF47QbnbwSaTmKh+v3Jwto5ZmOVmlZjHXnMVX6mFaRjN8dX1qFPYPQDwrZPH
         1epZaRqSIKlu80qJx6tvOyL4ncrLYTJZbR6FnUNQAL7R5WiPNSgQs898hkn8Fgl29cDX
         QbQg==
X-Forwarded-Encrypted: i=1; AFNElJ8ucDookv68TDkq9CdLdQc4aNOqeYMI6QbRo/nAQahdyYViDLAjU2TJKb1tH+AEoBsjx+zLvDozDrFx@vger.kernel.org
X-Gm-Message-State: AOJu0YzwWIgBeLvOdCqQhiWtSRbih73ewPtAH5eQrPOHpG5gV5SS4/pb
	LuWZBzgMK8yQhRodDT3QPQjOSqvgEaB2K3IHruWLytafS4WKZTsU/7z2
X-Gm-Gg: AeBDietIEo2C4cQwTmFH/1WFxCqDxI6Hd4dgfHcDCFXnj2rWtS2WpY9buzzDS/DUdC4
	i/tO6sRkTrUUAXKikgGvZBLNw3qegZdGTo9d+wqSWAV+sRaxjYOuAQWA4MhFJnTPSliP23P3T2w
	UTlclNm8CQnzxMbD/ZCbzHci5CQ1MbwTpAtuQFZScDSiBtIX6hYYSzn0nPaLIivUAvi8h0d8TnY
	UwsSgHZpxYQVibUuJ6l9AyA45a7B23eZ/gpSDeIsbmsK6JBA10tcFQVke1DQRfkaR9395YXmSts
	5WcUSGXm/Pq4rKUWNT9CjyH0c3nL06X0k1aUh2MraxlRcRgZgOaa22CNvgEMpkzM8mcCnt8dyv4
	3XIPlbzdHupe3jdeQ/9pDgcfFB+sL3u+rmvsb1bnjbWGJwa/TCwDYXHvdslFDsR0kbcLOmDriGD
	bMa0vOI4PkJrMExb8bsvEHHW6YMXenrWr+PRO/u6U+Blqq7M7b1zzq+gG8NMb4quHe6D6ZLzDyR
	G79N6SIARhw3w==
X-Received: by 2002:a05:7300:a18a:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-2efb79cc45amr5796129eec.3.1777940761972;
        Mon, 04 May 2026 17:26:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:5b87:9b19:32e2:2981])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3c05dc28sm17470773eec.30.2026.05.04.17.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 17:26:01 -0700 (PDT)
Date: Mon, 4 May 2026 17:25:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] ti-ads7950: fix gpio handling and facelift
Message-ID: <afk48YT55Y89Gq0J@google.com>
References: <20260405-ti-ads7950-facelift-v5-0-1f980ed3cf9e@gmail.com>
 <20260412193856.1300770b@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412193856.1300770b@jic23-huawei>
X-Rspamd-Queue-Id: 0F6734C566E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36107-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-gpio@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, Apr 12, 2026 at 07:38:56PM +0100, Jonathan Cameron wrote:
> On Sun, 05 Apr 2026 21:39:22 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> > The original reason for this series is to make sure ti_ads7950_get()
> > returns result in range [0, 1] or a negative error code to comply with
> > gpiolib requirement.
> > 
> > During review David noticed the fact that the function also clobbers
> > gpio state. Fixing that lead to adding cleanups using guard() and devm.
> > 
> Applied to the testing branch of iio.git. I'll rebase that on rc1 once available.
> 
> Thanks for persisting with this. Indeed a nice facelift ;)

Jonathan, is there anything else you need me to do?

Thanks.

-- 
Dmitry


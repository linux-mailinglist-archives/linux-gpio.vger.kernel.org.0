Return-Path: <linux-gpio+bounces-23225-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E341DB041D9
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 16:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FD4A1F30
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Jul 2025 14:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEBED259CAE;
	Mon, 14 Jul 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QofdWQk4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BBA2561D1
	for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752503809; cv=none; b=TGebzadWcUFcW6rbH3r2t85K+6ul2P8eK21cex3h45o4ieMvV1gpIjlTt3YVs6XWnqWymzq3Hkbku3zpLPB50qB6DKjnZjZpguuo0vE0mfL2SoPbZgVbQlmreBW8qWeGTbGbKIxjquR7UfAhHfnGBwum95Qr+MKxJe2//tjhU20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752503809; c=relaxed/simple;
	bh=VuqqMa72HKsGgw63UuN5cHyjaBeUWVPHJvFJII6coOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck38kHvu/nsWdBIbh5RdAuWdoI/PvWngIqyKSIdFUu3rEwAht5XdhlvYCktqogUC/Uv2QAHdz1PpwmUGBXRxN8BMDIUvLnpRpclPbIxXlgu5gXEWPZcggdwXjgfF7gz5augOFRqeizYW63uOoJn7L4C+6C5RIThcKGDtetpCoac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QofdWQk4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752503807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
	b=QofdWQk41WMC7DICS/FesIZkg0EolD/Yey0zVDRAM7KDlmVsvjXeoxff+u3UhR/kqGM26Y
	HT0bj+d+a0xFWMRvDN4UZqHOZImKVtwSP4o6saF//U0Lj6yOKu3i5Bnd6o+E1n2QRumc0a
	kh6k1UkfZWKq6vPrGQoLmW3CaeGchTY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-olwLxxtPMiK1eEWS_MEruA-1; Mon, 14 Jul 2025 10:36:45 -0400
X-MC-Unique: olwLxxtPMiK1eEWS_MEruA-1
X-Mimecast-MFC-AGG-ID: olwLxxtPMiK1eEWS_MEruA_1752503804
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6097b0f5aceso4294543a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Jul 2025 07:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752503804; x=1753108604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stVCHu6LKp83uxTYBPZjVntnTY6VyQOczeCpnXoPZFg=;
        b=m6pHreAC2J3q06c130A1yxXEEpsBZzljuWtBFK7n0pL88U5qrIrBsOblF6NDwK5Mzx
         RIASzRG80dpkaLtkICsO97BnnpXdfprqNAWvUDcVpCal+5SAKUuyY30KuALg30dVHzl0
         pFX3euA0s8qwUyBX/uXBeg3FDBz4P4ab1kxSlB5zCVdEyfS94L1C30qhz1NTYdrPJVt4
         tuNhvZM5qii+9XzyBUIE3zaSRFvORT4HcSTv9sbSawWvCs6vooxEy6u9k7EVxBKwXNBA
         2n7GfNot/iHnYAtJtssxnZTREZ62nqb/aynYvvzzoGB+ZDxJTF/qlqRR2rOkL5QGlblM
         PudA==
X-Forwarded-Encrypted: i=1; AJvYcCXAMx7qlVVz2TG59Bv29xO1dJbT52JxyY2HS0jEU88faWUNm+9hha6t3tWmyToGfB5/llfeqJuL6DfF@vger.kernel.org
X-Gm-Message-State: AOJu0YwJELlkz79bVuuCRyGnSwzoLDla8GNaCCK117sMpMxsAjK4J5UJ
	3qjTXhElqCSNtU5S0G6hWBfsE2pk9bryczkbD5UvrVRt292yblgkjJaEC8D012LfPQRB+FILQ7V
	mxVUr+iWoLHVbBuP1ZiwOsl6jZwNKVbMWFL4VomMg+rpHSHuhYbgvGZI75XP49lE=
X-Gm-Gg: ASbGncu1CU5dQVhcyboE+MtmLAEdvYi8ov9nkPctmyIZxm6BL5yJReh7K+9pfybIVQy
	E8Q7OEYKKRvnoGULF9ALYD4rr+1Q0t6ESBLCivSG03rdSAPx3mi3up7LcGSovJRfTh6/WTe8kWS
	itUWWmwSZeGignLk7sj8aCvFvgj4BZyIe68/xnCUNigdG6mvoA3KNNuXhCvGudCKtqHIoVYSLIz
	pcWkY0NIYdMt1CFM3SbPTbhtugoKOSdjW7she23Of+l7zgC3smpZz2DzhSNpG2B9lL1vu6xFtan
	e5hBoMo/phjwUmaN0bylYXLbfxg/fC8diQrG5K/Vi0/1
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263812666b.30.1752503804289;
        Mon, 14 Jul 2025 07:36:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEf9LW2oVjZhF5sLUcvf0WPEAbAeIZPxgH40L/19uJOl41oKRe5Iyk5Y7lPc7HLnpXjTK6irQ==
X-Received: by 2002:a17:907:8689:b0:ae4:85d:76fc with SMTP id a640c23a62f3a-ae6fcbc35bfmr1263810666b.30.1752503803914;
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7ee47a2sm842823166b.58.2025.07.14.07.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 07:36:43 -0700 (PDT)
Message-ID: <71d9aa58-e166-419b-9d32-839f5c4ad62c@redhat.com>
Date: Mon, 14 Jul 2025 16:36:42 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] media: uvcvideo: Add support for
 V4L2_CID_CAMERA_ORIENTATION
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20250605-uvc-orientation-v2-0-5710f9d030aa@chromium.org>
 <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250605-uvc-orientation-v2-8-5710f9d030aa@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5-Jun-25 19:53, Ricardo Ribalda wrote:
> Fetch the orientation from the fwnode and map it into a control.
> 
> The uvc driver does not use the media controller, so we need to create a
> virtual entity, like we previously did with the external gpio.
> 
> We do not re-purpose the external gpio entity because its is planned to
> remove it.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

...

Taking a second look at this I noticed the following:

> @@ -1869,11 +1869,15 @@ static int uvc_scan_device(struct uvc_device *dev)
>  		return -1;
>  	}
>  
> -	/* Add GPIO entity to the first chain. */
> -	if (dev->gpio_unit) {
> +	/* Add virtual entities to the first chain. */
> +	if (dev->gpio_unit || dev->swentity_unit) {
>  		chain = list_first_entry(&dev->chains,
>  					 struct uvc_video_chain, list);
> -		list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->gpio_unit)
> +			list_add_tail(&dev->gpio_unit->chain, &chain->entities);
> +		if (dev->swentity_unit)
> +			list_add_tail(&dev->swentity_unit->chain,
> +				      &chain->entities);
>  	}
>  
>  	return 0;

The double checking of if (dev->gpio_unit) / if (dev->swentity_unit) looks
unnecessary here list_first_entry() is pretty cheap and this only runs
once at probe() time. So maybe:

	/* Add virtual entities to the first chain. */
	chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);

	if (dev->gpio_unit)
		list_add_tail(&dev->gpio_unit->chain, &chain->entities);

	if (dev->swentity_unit)
		list_add_tail(&dev->swentity_unit->chain, &chain->entities);

?

...

Regards,

Hans



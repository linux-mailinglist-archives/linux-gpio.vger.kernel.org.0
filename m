Return-Path: <linux-gpio+bounces-14443-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC1AA00200
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 01:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 980C93A3521
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 00:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F4D3E499;
	Fri,  3 Jan 2025 00:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="mOkTDaQ/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mr85p00im-ztdg06011101.me.com (mr85p00im-ztdg06011101.me.com [17.58.23.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEAA28FD
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 00:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735864200; cv=none; b=Q30y8uzSI0xzGiM01p+njqvEyvtexOTvMfqmxwAsx8PlRKZl312yLXcMO9PkPhjF9a8d6GAyja6VFWXJveISjnHHGhGZoyU1hetTLneO1f1Y5zqRm+RMdWcu6CDwWa+VJ/U6BmeXQ24SsYMSzONYa7QV2mcuiFXLef2A8amv2t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735864200; c=relaxed/simple;
	bh=9OKtjR1OqVgdyYo7PBAJ2n+E+ZuEA9Qci0SNdsRT6zM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNBc8NQv9vuAxtT+Z7T7Mnpy7J+6dt2xuKjH3YRY0tAvQhXIXJtKt4AFZDrcYVuFk2SMwn3BuviNQMNi17GD16XaIBf24T+UKGtLy8cmbYHPU8pAWwLquz4JSDzdh/Fiyp31EQI8ZG5ZP4NxPScEJMZEvlCtYyjLg/FahoFhkrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=mOkTDaQ/; arc=none smtp.client-ip=17.58.23.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1735864198;
	bh=sX00kjdMMkpbEo7t/2MEjZFR57bisypxfIJ+Q9mKzxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:
	 x-icloud-hme;
	b=mOkTDaQ/GuVii6DBvUjnFzJIAdLAeaaL2tmFlRCZ4P+A6TYAVQrRWp9Er4PXba69V
	 7uSsUCLtOa63r9/3gMumkZmwFIEJtfG9H7DrHOBn8VlVz1XIhdLGUpypXWFkWu6bB8
	 12Lwz3XHfyn//c8VkfZ/5/nckvSnkCoTO1R/fPwDGARAEbrdQkb/xTRlQjO1qZxC/z
	 RJBK/KTEi6Bfsh1R4xlfoaQqy05mCIS0oWki+dsxYfz4DoTRws4M1be+zF4Ihp8ZaV
	 YgKVNniBsmJEp1/jlXOCVacxKat31ZnCxX15TS4W0gpYAvwSUtQIuTLSHGpxBZ/hrZ
	 LrwcTpexf4FRQ==
Received: from [192.168.1.25] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 0B02FDA0388;
	Fri,  3 Jan 2025 00:29:47 +0000 (UTC)
Message-ID: <2f8abbad-a70c-4ff0-94c7-8a8a37ad0845@icloud.com>
Date: Fri, 3 Jan 2025 08:29:43 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] libnvdimm: Replace namespace_match() with
 device_find_child_by_name()
To: Fan Ni <nifan.cxl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-sound@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, arm-scmi@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-hwmon@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>,
 Alison Schofield <alison.schofield@intel.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
 <20241211-const_dfc_done-v4-1-583cc60329df@quicinc.com>
 <Z3bYMiOG0u3Jtv3h@smc-140338-bm01>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <Z3bYMiOG0u3Jtv3h@smc-140338-bm01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ybkBbilc0XTCT_YEDgTjyLJ9DRFrwcwH
X-Proofpoint-ORIG-GUID: ybkBbilc0XTCT_YEDgTjyLJ9DRFrwcwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=738 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2501030002

On 2025/1/3 02:17, Fan Ni wrote:
>> -
>>  static bool is_idle(struct device *dev, struct nd_namespace_common *ndns)
>>  {
>>  	struct nd_region *nd_region = to_nd_region(dev->parent);
>> @@ -168,7 +161,7 @@ ssize_t nd_namespace_store(struct device *dev,
>>  		goto out;
>>  	}
>>  
>> -	found = device_find_child(dev->parent, name, namespace_match);
>> +	found = device_find_child_by_name(dev->parent, name);
> Looks good to me.
> Just one general question.
> The function device_find_child checks parent and parent->p, but
> device_find_child_by_name only checks parent although they share the
> code except the match function. Why that?
> 

Thank you Fan for code review.

I did not touch device_find_child_by_name() parameter checking at
that time.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=903c44939abc02e2f3d6f2ad65fa090f7e5df5b6

since
[PATCH v5 05/12] will come finally.
https://lore.kernel.org/all/20241224-const_dfc_done-v5-5-6623037414d4@quicinc.com/


> Fan



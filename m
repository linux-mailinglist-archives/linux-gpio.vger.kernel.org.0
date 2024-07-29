Return-Path: <linux-gpio+bounces-8437-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EA293F70A
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 15:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74F561F2267D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 13:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BC814E2E2;
	Mon, 29 Jul 2024 13:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="kai37MHg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from omta038.useast.a.cloudfilter.net (omta038.useast.a.cloudfilter.net [44.202.169.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBD14A0B7
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261177; cv=none; b=iFeboro0linj3+5YbNJC2sX5m7W7kGG7HkCkGJKP4Gpd5WJr+/5GxYVbC6VwsabBbXi+KtpFfDymE1yPYVxOkT2L3NjHYNLFIimV1l+zjY4pLBWKuzwlFHRBvMwg4iEdzDxJHWAohgAyX4+B/FqJSiONuwSBQUGPL/T6ZbFW3dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261177; c=relaxed/simple;
	bh=aS2tgG9/NzOOkn84vlgGJGG9s7liXIhI3pGPOOkuqbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KtAKAnqLjivIc9pHkpmTyx7Dk2oH1+fNA0WrJYjuOnvhhIwezJbEEMfA98ZtmWk2f+IMFbgp7hr/2cOf7tdiunRFO+a95vFcMJv6IMhvriwh2I5gCArwndicxQIqghCFPs7mp3OLjBZxwB/Ye31tYmv4Tlvd3P456S4jDFXLx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=kai37MHg; arc=none smtp.client-ip=44.202.169.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id YN0msBjkag2lzYQnxsw1ow; Mon, 29 Jul 2024 13:52:49 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id YQnvslUM1WW9nYQnvs9ls1; Mon, 29 Jul 2024 13:52:48 +0000
X-Authority-Analysis: v=2.4 cv=U6yUD/ru c=1 sm=1 tr=0 ts=66a79eb0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=frY+GlAHrI6frpeK1MvySw==:17
 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=ti5tFa4rv3dDs8Lo-yEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ey2z5Jk9GDQ7+0LaSP6jd5R9aWzGr9Rh6NdHpDOCB+I=; b=kai37MHgpvalZbEpchcX6jDY/K
	No8pAgIVBfStEWX+wEjD4poVRFool4yjGT1H8iMuoeiyO2r6b8pUsRsWD1HmoiYecH4tcY8iSYYuB
	Yg0z6UxSfw1O8vphV89EKQ6djIoTVZ1YAi+mATiVHaedZ5w6hzRIHcIcz+DzND6CTZQmypbNKMVs7
	FR39vd3xeKOG9JXx7Q0dp8aDMfnm4iKo31Zmj9btjvwS+fPuXU/ioTYxbr/itInv1Ti/hSva/71uz
	x2SAz1JVOFjya39kvrEIPq1Obqbn39Xm7g3Qd6u43oJ04bLCxfaqoAbhHKn9JyiYuU36N+vmUG2OS
	UQqcXy2w==;
Received: from [201.172.173.139] (port=55406 helo=[192.168.15.5])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1sYQnv-003KJN-0H;
	Mon, 29 Jul 2024 08:52:47 -0500
Message-ID: <d5b55e8d-a346-4dd8-adbe-bafafa43175e@embeddedor.com>
Date: Mon, 29 Jul 2024 07:52:39 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [drivers/gpio] Question about `ljca_gpio_config`: misuse of
 __counted_by
To: Linus Walleij <linus.walleij@linaro.org>, Haoyu Li
 <lihaoyu499@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <CAPbMC77iDKaJvc_8Qq2SqQ-mnkAJyeeADGhWx-jgUV7KsCi28Q@mail.gmail.com>
 <CACRpkdbaRNigfU_mLqcJJckwFz0+14NqWP_TpYqbONCa6wAH6g@mail.gmail.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <CACRpkdbaRNigfU_mLqcJJckwFz0+14NqWP_TpYqbONCa6wAH6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.173.139
X-Source-L: No
X-Exim-ID: 1sYQnv-003KJN-0H
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.15.5]) [201.172.173.139]:55406
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPSASNPOsdwvF5WC50Bqd8hRlYRWcLfsFSAyKvYUBDz6CaXE7QUPpmFzL8MPO5/uqDFkeGD16OYAOOXjetrReQfDcw/maKVlaKKPfB6YMwbf2mfYWAYB
 ChfwDCPv1QKyLUu/YFeTpFXvJbu81gzlzPpbDaWKbyAYN2uyB8Fm4GE9J/FdYG/tekSaOKTN6Dbj6It7Si/qpMiwRLpdg2YTZsBxQbD0mHjPFmfjQ/0plEp5

Hi all,

On 26/07/24 14:07, Linus Walleij wrote:
> Hi Haoyu,
> 
> On Wed, Jul 24, 2024 at 11:12 AM Haoyu Li <lihaoyu499@gmail.com> wrote:
> 
>> Dear Linux Developers for GPIO SUBSYSTEM,
>>
>> We are curious about the use of `struct ljca_gpio_packet *packet` in the function `ljca_gpio_config` (https://elixir.bootlin.com/linux/v6.10/source/drivers/gpio/gpio-ljca.c#L80).
>> ```
>> static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
>>     u8 config)
>> {
>> struct ljca_gpio_packet *packet =
>> (struct ljca_gpio_packet *)ljca_gpio->obuf;
>> int ret;
>>
>> mutex_lock(&ljca_gpio->trans_lock);
>> packet->item[0].index = gpio_id;
>> packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
>> packet->num = 1;
>>
>> ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, (u8 *)packet,
>>     struct_size(packet, item, packet->num), NULL, 0);
>> mutex_unlock(&ljca_gpio->trans_lock);
>>
>> return ret < 0 ? ret : 0;
>> }
>> ```
>> The definition of `struct ljca_gpio_packet` is at https://elixir.bootlin.com/linux/v6.10/source/drivers/gpio/gpio-ljca.c#L53.
>> ```
>> struct ljca_gpio_packet {
>> u8 num;
>> struct ljca_gpio_op item[] __counted_by(num);
>> } __packed;
>> ```
>>
>> Our question is: The `item` member of `struct ljca_gpio_packet` is annotated with "__counted_by". Only if we set `packet->num = 1` before accessing `packet->item[0]`, the flexible member `item` can be properly bounds-checked at run-time when enabling CONFIG_UBSAN_BOUNDS and CONFIG_FORTIFY_SOURCE. Or there will be a warning from each access prior to the initialization because the number of elements is zero.
>> So we think relocating `packet->num = 1` before accessing `packet->item[0]` is needed.
>>
>> Here is a fix example of a similar situation : https://lore.kernel.org/stable/20240613113225.898955993@linuxfoundation.org/.
>>
>> Please kindly correct us if we missed any key information. Looking forward to your response!
> 
> This is a Gustavo AR Silvia question, so let's loop him in.
> (I think you're right, and we should make a patch.)

Yes! `packet->num = 1;` should be relocated:

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index dfec9fbfc7a9..c2a9b4253974 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -82,9 +82,9 @@ static int ljca_gpio_config(struct ljca_gpio_dev *ljca_gpio, u8 gpio_id,
         int ret;

         mutex_lock(&ljca_gpio->trans_lock);
+       packet->num = 1;
         packet->item[0].index = gpio_id;
         packet->item[0].value = config | ljca_gpio->connect_mode[gpio_id];
-       packet->num = 1;

         ret = ljca_transfer(ljca_gpio->ljca, LJCA_GPIO_CONFIG, (u8 *)packet,
                             struct_size(packet, item, packet->num), NULL, 0);

stable should be CC'd and the following tag included:

Fixes: 1034cc423f1b ("1034cc423f1b4a7a9a56d310ca980fcd2753e11d")

Thanks for catching this! :)
--
Gustavo


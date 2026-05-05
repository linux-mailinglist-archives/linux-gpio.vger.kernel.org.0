Return-Path: <linux-gpio+bounces-36207-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NBlGZfs+WkLFQMAu9opvQ
	(envelope-from <linux-gpio+bounces-36207-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:11:51 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D71714CE359
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 15:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E2CD30451D6
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B068439005;
	Tue,  5 May 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="V/mPaVc4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G7G/cpe1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF6B25C80E;
	Tue,  5 May 2026 13:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777986672; cv=none; b=SV6obWutl3OVe0eu9pcHySTCWCJv6y1ZLvn3qs6s9V80QeXRixO1OtsYJGUb1OqgFINoIjXxN7hJZsxCxPpNVvguBlWioyYgU53EOuYlELVXKLcwBjbY5M4zBUNFNhm2EPR5pBtXT6z5avZJmgnj013eM00o9LLxHEqmhgl6lZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777986672; c=relaxed/simple;
	bh=nveebzya/Kf6xBzraTxBxu4ebcxUp05l3nvWHdnMvLY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=qPmpZF79bEbu9qDmCPkdL5I1UBwkhaDLmikL69EJ/imJ6ScOPpovOcfcmDvhg6OfSawCHjdOmpNpL5nRf04kI2qoK2ydOHvgUNupsTiC5HOKRFCokzhpaIZqp0+I+I9E8UuWgAIGEevz1xiprDvYs6yH7TvCCDqqfopRg/8dwfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=V/mPaVc4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G7G/cpe1; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5BACE1D0003F;
	Tue,  5 May 2026 09:11:09 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 05 May 2026 09:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1777986669;
	 x=1778073069; bh=vLCw6VwPgBUbbgjiBde52etDTlj453NlTbVSXUs0f8g=; b=
	V/mPaVc4dY6XQ9MSQe1q+mwS8JfW1Z5R3V3X1ysEp8It+G5H8yZyEa+me+VOjadc
	rfG1ArbK9sXaLh9iSeYYdsJsoPVESAaU08YK3ZUKz0FClXX3CqyXv6cVVPBWV4r8
	2+9GpnKWrp4osc7IN4igY1JgTOxlJGwg5cxALqB94R9fhRzTVSckLLH969GVX42Y
	/gRGZy4QYhfmle9Tw3vv1H+gXqcVgJlMSf25TrbELJq1nVqRtszNHSE7QhIYaM1a
	HJ078Qdk3aqiUgwBLmQ9jbowhsi57FxeSFyzipQkVYSW71Fc8fna5DetBQlfae3u
	UgoSrBoJbYWU9BJRs7XkXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1777986669; x=
	1778073069; bh=vLCw6VwPgBUbbgjiBde52etDTlj453NlTbVSXUs0f8g=; b=G
	7G/cpe1NhtHEAAe5AT/nGejtJ822kJfb7IHaEc5tRVq3BpPwi5lqSTMIFJtpnOUU
	wfa6yUiivYAmUd+aFHurx6IgLXABmV7+jo0zWeu2OyImRBxNaq+Gt8OwlMie/L5b
	z/V3dLBgvIanqwyhQEuSp8ycw/P/H3CGVA2pbyYkBhiRJCPGZkwTf7DX4Ovo+Y8m
	V90bfQWFa0dtkoH0QhtGNzzwCA+Vv6epmfzE1bEKVqSkzhP4PzCJC7O1b2nn46v4
	Lf3MMB10RX56xp99dIH1gqq9IcmoJcOJHYj1uOiV2GWwq0af9o00MJhChB9P+04c
	cO5SQz4k0q9dYw4MYtcEA==
X-ME-Sender: <xms:bOz5aQe0kTJ6z5iQHZsJLyZhxIZG7fftCZvYJegzCwxF6tpZfdWuFA>
    <xme:bOz5adDEylOJiOT09-4EXY2g03vsFEtXX1ikhHVIIj4OrzjaygxzGPzhVo876wlca
    lX0BUGktaNVGjpD4kpXEDB03uadTCHkNmcMGzj2tforX-5HdLS0lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddujeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhglhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhushifsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghvvghl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghnkh
    hosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqghhpihho
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bOz5aYYtg6rhgT-1pYbvJOzA4RALQkJ7q7NsZ0H5gJkCDwlJvnMPzA>
    <xmx:bOz5acAJl5fg-2HOcBDere1eg8JG9RsCzUvdcMt1enMt0YQHn4kzxg>
    <xmx:bOz5aaZ59rGRqohhkczVzi2ysKoDGtVMtm6pd1mdssXMejF_DnjItw>
    <xmx:bOz5ackKECD5WxiM6mlY0IOr5T7hTojK7_-Kyqec6s6CsmjZm9ULcw>
    <xmx:bez5aZNXhk8KDdpFRzZciM7vNn3okGNrnKG2PrV2Zq7jWQ9tUsJOI1sB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 613B7700065; Tue,  5 May 2026 09:11:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ARrtNTmGjyOc
Date: Tue, 05 May 2026 15:10:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Message-Id: <bfecac99-3ec1-473a-bd5f-e49ae48aebf3@app.fastmail.com>
In-Reply-To: <afhLS6xwHGm9_mLy@ashevche-desk.local>
References: <20260430091202.2724109-1-arnd@kernel.org>
 <afhLS6xwHGm9_mLy@ashevche-desk.local>
Subject: Re: [PATCH] [v2] leds: gpio: make legacy gpiolib interface optional
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D71714CE359
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36207-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:dkim,messagingengine.com:dkim,app.fastmail.com:mid]

On Mon, May 4, 2026, at 09:31, Andy Shevchenko wrote:
> On Thu, Apr 30, 2026 at 11:11:55AM +0200, Arnd Bergmann wrote:
>> -	/*
>> -	 * This is the legacy code path for platform code that
>> -	 * still uses GPIO numbers. Ultimately we would like to get
>> -	 * rid of this block completely.
>> -	 */
>> +	return gpiod;
>
> Do we need to repeat the upper `return gpiod;` statement? With this split
> I don't see that we need to have two repetitive return statements.

Right, I've simplified this now to


static struct gpio_desc *gpio_led_get_gpiod(struct device *dev, int idx,
                                           const struct gpio_led *template)
{
       struct gpio_desc *gpiod;

       gpiod = devm_gpiod_get_index_optional(dev, NULL, idx, GPIOD_OUT_LOW);
       if (gpiod && !IS_ERR(gpiod));
               gpiod_set_consumer_name(gpiod, template->name);

       return gpiod;
}

which still keeps the existing behavior but is a bit more compact.

I think we can actually just remove that function altogether
and just pass the name into devm_gpiod_get_index_optional()
from the caller like

  gpiod = devm_gpiod_get_index_optional(dev, template->name, i, GPIOD_OUT_LOW);

Did I get that right? If so, I'll fold that in as another
simplification.

     Arnd


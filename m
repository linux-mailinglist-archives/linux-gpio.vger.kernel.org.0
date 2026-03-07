Return-Path: <linux-gpio+bounces-32734-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OqUOgxirGkPpQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32734-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:36:12 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FC322D072
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 18:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A34730221F1
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 17:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DCB33A9D2;
	Sat,  7 Mar 2026 17:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oiOBFlvA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BA3338599
	for <linux-gpio@vger.kernel.org>; Sat,  7 Mar 2026 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904955; cv=none; b=a7UJmxA058Uv+d5I5+PdMQ5T0dz6UCPkbfolHj5sAeBKktEDJ3P7pu4rkJoZ8JrGu+fo3Qz1iyDSifhpkwj0McGiu7MmUNcX+gpDlEmgkeCrxUllki5KkRbEvKcwF1cFhR+3z1ZV6CSVjSoTwO2MilKUr0gstZFCWuW1sKQjpU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904955; c=relaxed/simple;
	bh=IdlikrSxlKRlIV8yOYL9V7FN17UFwg+5SA/3zwMVLzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1qYSbODq3R1ui49Zo77/LfKnpKh+pSkxzrxCMaKYWOKg/Cvk6hdCtrUJzu3YM6ndLLUEB8Gss3dCU72V6pHSoj3PfEZSa+OGFUobBojNsGU+zoF7SCnw5hajacNoDTR3963UDkOWB6/QKRQsGlclKt7+R8q0CmrFCGR9qFGkF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oiOBFlvA; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-464ba2bb3aeso7606752b6e.1
        for <linux-gpio@vger.kernel.org>; Sat, 07 Mar 2026 09:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772904953; x=1773509753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDkcsKgSUge1OGeONN3ftwbPvkeD9dQGZlZ9gDV45A4=;
        b=oiOBFlvAk07mc7goyM3NCc2X5FRsf+HVHv7Gja7MtdWDcK6PpLJ+ggQ1cLp9VT90oM
         +ydNNKZ6cHq9ftEWYsqqDfCEEkYgUHANdz+I04eQjKqs/iBaEM7xQx7mqwHwOH+BNQHQ
         Huy79iJpmgQEU5fbIFit8KD9Fk6nGmBhpZVgtmQmUU2RJT5cly3N/1IfzjCSzcXo5+7l
         U4t6h8/PLOY6Ctg/Sk6DxGUOaBvtElbO4I0LWF9uRs6s0y7Yxm75Ta8n3uPqkdU6kCEO
         853msKwf3vJs66J1LiRQlaC1vurSeyZ6Uxu/IinpZ85RPryYTRimzrr9mU6tRdBGpW2o
         YAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772904953; x=1773509753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDkcsKgSUge1OGeONN3ftwbPvkeD9dQGZlZ9gDV45A4=;
        b=HR7focOF0ku9XCKcYZ/ry5PlAiyiPRAv66oMYNhdq8R8ADq4+1IKxPpsxUtbKF+1zl
         icwLcejnbUClDw10JaJzANr/drHT/d4oDBNiJw8j7tqxt1F4mnR4MH+Z/4EMZiksr5Q1
         B5/29OcorPpRsYe4TkghqvS/LjimFc08srmm8x2r4aX5EEka43q1F3iug4qDCItKnjoC
         vxcbkNPLtgROu4ezvajywFB1uo8loE3+PQI92OAE9lvDFKT25ZySZC7Nqe/u5PcqrV4D
         LTqfN9HlFviBdwPnXgg2wd0Z3SrDW87Y7lC6VBxAx+OR1fg2PDrTMns4Ju72y5XKewq1
         HYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpKxnLQuhP3UXKmhOXeg8XgssZtgAPekuUP0Vs+BjknyBMohqPjvzEqNw3i+chEr5BxEvaIW96LtQQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVIyk7dK31XrKSPUqsQ6WUknvYMs+K0aA7M5RECeu6Bf5YkXrP
	ruoj+ytQ8I650VCUTswNbwbqNqvpIx7sPQE9/bPXjIAKLGh6iCSkoihjBkrUm7i3fJs=
X-Gm-Gg: ATEYQzwklb2NgTcejkyMEDzK3fRxyOMEDu/HvxolrfvufrysFoQsj2N4i2/NRmcJr82
	S00vmHgjvciKhs1r6mtE8bpsvIIbMIgSwwNOU6BiUGSScAnD2+XhBoy4pZ8TtsdwxPJ4+M4aP7S
	5IOM82Huzf7iNdXJA2KQYoDVgw9YMl2hN8848y8Tr/IBsa15kS7hhgwGq6W4CYBwbef/bTnnpW+
	rjN+uN1BVL0m6TKnryfV6UuuYi3/WtBnooGgZzJTC8dNPR7dYzd8gTkfFoVHrXScdka+531FlMu
	EWCC4EahKiZS3UdstBHJK+XH1wRRSgentYcdMns3Sso4Khj4bz7Xn5OE0AvN0esHrKqL+MqSshQ
	fyUCknC6e4prc6qFmt0dZWz0DnNgU3UtfqTb6hMVi0RNnWIShCfUcKHX3qirVyKf+1Pu9s8GZOe
	Mh/HNrq1qAPWpiMzYd6si4uJxM4uk7UjQY0igns1nbS0V5leMMV4TiNfkuluJMTVqwY8SOeDB+8
	A==
X-Received: by 2002:a05:6808:4f48:b0:450:826e:5df1 with SMTP id 5614622812f47-466dd0f718bmr3563525b6e.19.1772904953014;
        Sat, 07 Mar 2026 09:35:53 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-466ebbd7243sm1402325b6e.3.2026.03.07.09.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 09:35:51 -0800 (PST)
Message-ID: <1b78fbdc-e695-4d7d-8531-b02e98a903c8@baylibre.com>
Date: Sat, 7 Mar 2026 11:35:49 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] iio: adc: ti-ads7950: simplify check for
 spi_setup() failures
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20260305-ti-ads7950-facelift-v3-0-a23fdd1a079e@gmail.com>
 <20260305-ti-ads7950-facelift-v3-4-a23fdd1a079e@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260305-ti-ads7950-facelift-v3-4-a23fdd1a079e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 68FC322D072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32734-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.972];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Action: no action

On 3/5/26 1:21 PM, Dmitry Torokhov wrote:
> spi_setup() specifies that it returns 0 on success or negative error on
> failure. Therefore we can simply check for the return code being 0 or
> not.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>



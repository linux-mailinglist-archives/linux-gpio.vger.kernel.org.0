Return-Path: <linux-gpio+bounces-36542-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBieKjTJAWoRjwEAu9opvQ
	(envelope-from <linux-gpio+bounces-36542-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:19:00 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A2550D81E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 14:18:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C125230060A4
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2026 12:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64263374E7F;
	Mon, 11 May 2026 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="f02+21+4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF036C0C3
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501935; cv=none; b=hkuOAIkru5+s1d8Kfjfd8DWByUZrNod0pSfyVzJgd7jGJKm3OmKlepQ0dArzHjhlmfVizV4ynz1o9t/WuZJBRIDWL0/DFLVezIu+jcp2163zxpKJuAKqiUpJgvbrXfoc+dtdCB2OFGZGrBb4Nm6ItFfbLvHlfmYB37ReEr0sTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501935; c=relaxed/simple;
	bh=92yGQfeCI+cHexXRG0l8wn90c0zGYqwUMog00urn0pU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4hD4M1Pl02U49s22ruAr1Xezy/7KUXXLpjpGTNM3KjhH5hjhA4RJrzpCyTIFt26d1owwHHrFo1AoKYrHtgxWicltM6Ob0MKP/Np0u7pBDdmRvwa8jCz+knb1AQuF6cgHxbGe79jYbk4a3IMD/QRxX9+25v87NHdybHnkJFrlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=f02+21+4; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51306c9f2e1so41942511cf.0
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778501933; x=1779106733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXoNsHVKZem33awfKNJAcElH0Wb3CAH59gzpZtaCRHM=;
        b=f02+21+4ruAB9xnB1XfgTdcrtsHzpp+KLNkHA6uy14JUtRqp3CEox16meVciNZarNl
         5lH1UVueqIhYL8XcSLgdsy+YwdnRoHfPAO0ky9bj/NAHEEQgUUf+gwhSTu+waE0U/rOg
         MavRJLyrlt9+2NyI5tZcNhiQ7oPrjqV/I2D/D4/3itUVG79QhZBBuSKL9Y6/JRsgY6of
         bYKdWD/n8+JbemIijvuvtpe9RWBvtSgmH5T0YP6oqCD6QlLz4kQxvxjvF/ZxuJA0x5b5
         CJ3md6bRSrPobWaDm4Dk5Jp5vWwyjohSbP9b0xYua16C4SDmRCvl1ENWXNqUUxGJkMMI
         1poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501933; x=1779106733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXoNsHVKZem33awfKNJAcElH0Wb3CAH59gzpZtaCRHM=;
        b=UyueOf6pnKxFlzunfDVinQnKifJRvd83mTiXtM3IC5ECGVSgcIMIuQ4UAOrfz0KJ6F
         3I2SHxVopndOJ0OQh5lA36TLEivBIgisnwN7abgOZwsDDI3p5Ph+EDc4WNNGBJIkYAgi
         59FFZO/KWvMlkjEDvb2cV/JzRakXl2Mdf1Wcequnoks79u/Adjsd7BHcGazA9j0oTAiT
         aYlK4jlgLkMwWGhu2l5WUvSa8K7ES91L41LN0sVasAc2M/rVQB3TlcHiCmCuqF8XvAi1
         VhMoN92Mzwv6l2zLYzsgQUG3Ep+3rsUFgrzHVmPwf0cpcevNQWVxJL16pSp+5ueCnpQs
         W2MA==
X-Forwarded-Encrypted: i=1; AFNElJ+3wV5IHP5vQjZT/A7o1N+yMZmD1IAslvbFK6Uexn5Vbt52+RsfIrDfOUN7oS7yngcq5VV78Zrzgz3h@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLqn+vnQZmSN8WKlsgLb1q8ebuiHduYTZ5w3BpOrscUGkSraj
	wfKoa+fU6HWymtA2YYfy/IfbENB7yfH+TCGKYRM04HyhNLfILYQqTGhHnx0WdYWCmgE=
X-Gm-Gg: Acq92OEfkCNC9a8bYmZpTNKRUsxbKK/t1MoXGgxfzIiaoem0A0BythcUYo/6QGeXQ5j
	5GRzCN7/hlxvHmxnITVkAoUT40vHvt1S2Azu3i1uDcd/xi1cUTuesBka4ZpZsJjCuv1it4W14n5
	616qBHqGRDIuxBACUbRuzG4kQC6zqMTey5uqpjZigNPs4Hm3YGsY7Rhb1nAE423OmoeovdPQ23m
	odSxQIzS0+kt4q3jl+u4u+tjgY8poLu3mFTQJKbRJQr3t2Y+3ICb5fWQwdlU99PpEqP/CSx6MMq
	PNpSvapsC/2yDg6gtRX240Lo9Gm7o5MqmcJroI9EmOPMtDJWahoODscJoUZzCgh4Lt+tp3inwcS
	oqyvaHFXIe6Y2x2EtTTdOeU82EM+CXZyQHJSYD9BlxTcLSwT5Bz5zs+l7+yd9/ogwA2IljqNl4r
	BWbwW1wFw8xX3K5IyhheUxK7vzzToL3c9WiX9CASj0Vjh7QC0bUCP9x6+GTXTazhg=
X-Received: by 2002:a05:622a:1789:b0:50d:82db:773e with SMTP id d75a77b69052e-514a0b821bbmr136199181cf.47.1778501932686;
        Mon, 11 May 2026 05:18:52 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5148e6754b2sm87467491cf.10.2026.05.11.05.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 05:18:52 -0700 (PDT)
Message-ID: <e12be7b2-a24e-44a6-9a4f-9a90ab950d17@riscstar.com>
Date: Mon, 11 May 2026 07:18:51 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Improvement spotted during patch review.
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20260508-regmap-gpio-sparse-fixed-dir-v2-0-deee84df3027@kernel.org>
 <CAMRc=Mfzy=pWuvJ5Y1hqoWuYk8JSwzBxNFeVSwyFQ76CAEZXLg@mail.gmail.com>
 <CAD++jLkG35pTLY2=vyj974PjDax277ebqYd_WUjLOeQHEvntsw@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <CAD++jLkG35pTLY2=vyj974PjDax277ebqYd_WUjLOeQHEvntsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A3A2550D81E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.56 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36542-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid]
X-Rspamd-Action: no action

On 5/11/26 7:15 AM, Linus Walleij wrote:
> On Mon, May 11, 2026 at 11:56 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
>> On Fri, May 8, 2026 at 2:51 PM Linus Walleij <linusw@kernel.org> wrote:
>>>
>>> Support sparse unidirectional GPIO lines.
>>>
>>> To be used in a forthcoming submission.
>>
>> Should I apply it or will Alex just include it in his series?
> 
> I think it's easiest if you just apply it then Alex can just base his
> patch series off your for-next branch (or cherry-pick those
> underneath his patch series).
> 
> Yours,
> Linus Walleij

I'm good with that plan.	-Alex


Return-Path: <linux-gpio+bounces-36320-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YL8xO+mN+2lvcgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36320-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 20:52:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FB54DF8B0
	for <lists+linux-gpio@lfdr.de>; Wed, 06 May 2026 20:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B396300FECD
	for <lists+linux-gpio@lfdr.de>; Wed,  6 May 2026 18:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD724C6EFF;
	Wed,  6 May 2026 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="yqlozRSf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1990548AE32
	for <linux-gpio@vger.kernel.org>; Wed,  6 May 2026 18:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778093479; cv=none; b=Lpw6zjMeITjjhBr/xl5ZCmuUEKIqNJr+fYXeNtgufBo3MYXlpuG6nCwvdbOJCkBh8DsHsB8UCXZWD2m7rFhTMweEuEiMV3R0bvOFyBJihYoSMYbhoOIqgxGnqqncIzaqn/HGzxe+8yfVxBYDubNFBokAj1gwdTt1poH0Lhq0RU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778093479; c=relaxed/simple;
	bh=s8SojpSoc+YK02FQkvYYyW4yXNu4hN2c6ETT93ArWJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V3X9f/LhACEhTsjBndmucT6rL8sfMNvUVPt0pgmEzyZIr4qJgBxD9WyL8M1MmaqExzo5lp5KZQIRruvii7C/f0AJB5f5Yze33JN/D79tlIXoa4tmtzp4i1kukldbOaRXJb6/IKd70XMYgsET5CAC1xA/xVl4QsukfxR3UGu1lCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=yqlozRSf; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ef45a6d9dfso3877985a.0
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 11:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778093477; x=1778698277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=yqlozRSfuCUJJ9D/wW3WpVlAitl6p+MalJd4d+qGeBPP7HHYOs15Ifo4zv4JyQM3RY
         oHUbujbmeUjmk/O4VeGR+RGnA5ACtoV1slnTP6zjtIbj9FGxzvsCksN3JeAJuUeQBmX1
         nRTiF8ZF9styqnDRIE7ecUgF92XqjybzmU2tpys//cSjNx11JXVgSmQFJy+B++GX2ZOC
         u6zWm0k2NWbcK/N5MW1WjdBqxvdMsVhpGXTL2VLC3zGDINTcSdycmkw83ftcdERHrH5w
         WiRYxhwO/qEdWGPjZdrnDZShFy8obFYV9aNveGpk9ZuEsT82efZmnwLdExxspdhvUjsj
         3Z3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778093477; x=1778698277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVXRMaORBAm1p+hmPERIzD3vaX/XPR3tJcXrI0tApsg=;
        b=BXGR7ErVff6ZlKpvWI3jbIJ9/m9DYx0wL+v2c19YFcQcrqcZYRVjzwvs2QzFtrHGKS
         52omcebvojx4UttxXHcgvGquZ33c5yj5cfl+LYybpm367WV2DQxE9Dur+QEbPQnacGtW
         9CHSdXo26o6YxwDqClV2JdAkE7eaTMwjNECbEzGzEcO19zu7znhVVtVRqasT7Hh2kIM+
         HH3yiDAb//SbPeJV30x/lzBNvb6omXwJ+uj6MnxkkNbryrg4uab/C0rA7VFUGdt0dzQH
         gFeca6d/sHT7dwMtKqLYCkssVCoY6+LbQAjYIN/e0tehtGkQO/8D32ZdbPwtW31KkXgk
         qq4g==
X-Forwarded-Encrypted: i=1; AFNElJ9wuLBecPEeVMdQXuTm450vGEpt342pUCHhTNR7z5wDxeCYQv6J3X5qCBRS3/Qmx49vF6HnijVuiWtk@vger.kernel.org
X-Gm-Message-State: AOJu0YxDCVSY26xzB1+E2BaGWrEE2/rbdpLj/wwZg0DR/CQ058bt+oF+
	rNg3xYmARI9fEpc6M1YMNXP+bQqhgSkeRfojAFD4Pf7gzm6j4MkefB0GyfK2/tr0Pto=
X-Gm-Gg: AeBDieu5k2oUiqqDbl7F1yJiouQS0RFAwkdtzgbkEnfNv7HK99RLzzOuGvhkXhj4Zqg
	o9BUPfsdGMWa0DmLoTA95Y9jYqHMmbnKIywbupMkq5cxHjEYxIvf/5e6vNu7i0ha42/+SFcLALR
	6ffj4stdN55QhviNQ3BkTJM/sOKcLEMEu1uthI+OWPVvPA8wTOsGpNW5KNi7R2Fo7SEn5jYzgei
	GEvTcaYT73Ph1sJSt76wLkGKlvP1CdzYUD/jqjlHwkY/bM/umzmV0Sa/QADnHMivXRQlKL9vieU
	HhsFQaz5t4oCBANHYipBc/eYiK+/fKGhUyz3zdbAXHotky6IGND6r/3yoQFUEiZTHyiMrVRKRgO
	z1mALaJ75UABOQpsxNq3g2HqxXcK7lOOhBpwbnljZt9VSGjeBs3IWr6ZxnGQALe4Zgs9yFVC/k3
	tJ/upWqC0k7+/cebwQ+AkisbgH0xe0JddKfNK0ljOivxi84Ppt7qB705PG6KALilXX9OJamn5HG
	Q==
X-Received: by 2002:a05:620a:1a13:b0:8cf:d804:456a with SMTP id af79cd13be357-904d4c54265mr713100885a.20.1778093476942;
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc293837b5sm1889639085a.10.2026.05.06.11.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:51:16 -0700 (PDT)
Message-ID: <a52659e8-0382-4eb2-ab2f-5563bbb73fcc@riscstar.com>
Date: Wed, 6 May 2026 13:51:12 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 09/12] gpio: tc956x: add TC956x/QPS615 support
To: Julian Braha <julianbraha@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-10-elder@riscstar.com>
 <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1fe6bcb7-b5c0-454f-ad54-5014006edab5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 33FB54DF8B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36320-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 5/2/26 10:42 PM, Julian Braha wrote:
> On 5/1/26 16:54, Alex Elder wrote:
>> +config GPIO_TC956X
>> +	tristate "Toshiba TC956X GPIO support"
>> +	depends on TOSHIBA_TC956X_PCI
>> +	default m if TOSHIBA_TC956X_PCI
> 
> Hi Alex,
> 
> In your Kconfig changes, this condition 'if TOSHIBA_TC956X_PCI' is dead
> code. Since you have the dependency on TOSHIBA_TC956X_PCI, you can just
> make the 'default m' unconditional - assuming this is what you intended.

I'm not sure I'd call it "dead" but you're right, it's not
necessary because it already depends on that symbol.

> Perhaps you would prefer to use 'default TOSHIBA_TC956X_PCI', which
> would have GPIO_TC956X default to 'm' or 'y' when TOSHIBA_TC956X_PCI is
> 'm' or 'y', respectively.

Yeah that might be better.  I'd like to eventually include
COMPILE_TEST as well, and that might need the "if" on the
default.  I'll find out whenever I test that.

This GPIO feature should still be a module even if
TOSHIBA_TC956X_PCI is y, because it's not always
necessary to enable the GPIO driver (depending on
how devicetree defines the PHY resets).

So:  In drivers/gpio/Kconfig it will be "default m", and
for drivers/net/ethernet/stmicro/stmmac/Kconfig it will be
default TOSHIBA_TC956X_PCI (at least for now).

Thanks a lot for the suggestion.

					-Alex

> - Julian Braha



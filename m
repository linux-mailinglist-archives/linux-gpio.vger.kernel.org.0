Return-Path: <linux-gpio+bounces-36418-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGbWE+cQ/WmwXAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36418-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 00:23:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B11384EFC49
	for <lists+linux-gpio@lfdr.de>; Fri, 08 May 2026 00:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA7E8301ECF8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 22:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07FA35970F;
	Thu,  7 May 2026 22:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Hcrw5OJh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21463344DAD
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 22:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192254; cv=none; b=Rr2G1IrjqzyB9PzDvhEoU3whdwsdwL0qb0LOBaA7kaICxXTnf8SayZdVhDxivEHisoLTNd8L5MZNJjCPwYUsn9+5rMpGh0FJYTb6MayXB6caxu/4hzR82+A8Jxwlt0E4kpgpFeoBVmf4aMHiA9Y7sW/HUBhYHux3ysZ7BI/IJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192254; c=relaxed/simple;
	bh=nUqtAeSwtxg2g10Nn3t8JgkOkKTEyo+HUlH2xOySZMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j52tsnSM6gAkgIJlSNtwA56vFfGd/seaEzzaWT1N18efhIwdi2ow2lByi47sd10zeMu4SctzzVFn8Z5iScRoKEdkwNNxjjJRBWdbqmVtadcT/SHMwxh01BzKpH6sf17Ds6DW0PUZv02dp64bWqbOF0M3agqLAW32jC67dBD54qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Hcrw5OJh; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8eab809593cso136871585a.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 May 2026 15:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778192252; x=1778797052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=Hcrw5OJh6PlWZxzRnvFn+UW5odJBcqGZFJAcf1xuY+dVv+t7TCtX/vMaAWFjnVG6Yl
         s8oCh094BPUtVBIgneGKmDXKHHuzH8VjK4vRJtA4Rl6w91nS9Sa03BErXGDM8Oha97dk
         DFBaOSG2YwDEK8fJ5SrMSPqxu79cKZLhgnOh89+RnV+k7iyV/GB6Z7JdiAXASADEJvym
         oylte+CJp0zC4SJBr5DZIudaLYj/Q9TVVIuLGNsdPJISYCzy4uWhcPby4JoMNC8bsoET
         O9flifkcoqz6p1mZHo5I5LI206l8rwCXTCivGBs2kjGFapbOr5zY4k83j5vAUmXaArLP
         LNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778192252; x=1778797052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2Ov38+ykmqD6nZk6coLqjQ6cOEYuoDtYD74/Mx9UCo=;
        b=dag4gAGsMsNMNUyNqAMlEmV598EFceTdByl3nJD8f9Nfl/9lJW5Ovs9Ly1V85BGsOk
         rOLnnp9OY7DZPyqVat6GZUchgRHpuVwX4SlWSN/9Iu4074PnXPwBdrP/N4EEAWoE/h1u
         OuldwrDpGxTD2YZGtS8f1e9FjZ9g2oU9c0xIXQetN1EQ+oVnGYOthO189HKmSWmXHZXu
         wVcoC5ZiztDo/e/PjqlFwZZms8fhpZbRpcIK234U6U7ol0td+jMSTjeZ9w4iaObQoBfH
         V+20TcwJYMAfWPPQ8D+vdDy1bvVnutW0AcMGaTGx9KVb1pz9cTJv1H3UoK50rUx09Gkw
         xb5g==
X-Forwarded-Encrypted: i=1; AFNElJ/o/4yeSD18kBcFztGkVFy6dvkEOmDoNS5LUE/rLor94tfaJLzXEQJ6dRTGj8JVp4uF6R1T931mXli5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Axqs/vg91gTH47xjltkYVI7arW9lu8aMr9UPPf64VKWdUTBe
	/F/WMCrDJkgAEq8kzUg0ZIkH3TvojVyFe/iCPNQMA0JdMIJcLKcgxqk67EkRjJo8ZfU=
X-Gm-Gg: AeBDiesJcU/0VJ+23vhC1a052nOYQkgZHCm9R9T1bXXGcodjNCZ8xkevVsk2fcCmiX1
	fB9kE7ijoHOlAk9ctFlpK76yja+aJppEyzpXk0dl6Aq9n90N0Bu/vEP6m6AzLC4JJWUakwsz6vD
	Rc2c3bITymaf64bCDwGSjoIzKn2LDTDGv2hs5AUmq5Qar+VojS83N+F/o6y0K87AayMgp6vAvpI
	1skxbrfsvVgXAu9KmR1CUsayj60hP+eCfkttVuDvKJksABmqtR3T23VQWrdoocZIDTF2OGglq29
	HzKb/wHyE+FmQUl23syI+uvhb9RV7n153pCSvtDJMNGVrzgaVI5aVHqjhucRNrFkh95tYBID7ud
	we6FMgNtWKpxg7/vVk/j0UW2E2Wl77e14LCdcw4bUFhgXgzwgjJu5BKBtHqNAJblNVXlT/ke3a1
	nuR8HajsPcHHM76obrrYMgM83eIc/OUIr2LlxtwhnsqYTzm0rLmuNbYRYByUy9ea7heI/AII3le
	jI=
X-Received: by 2002:a05:620a:29d0:b0:8cd:9033:1724 with SMTP id af79cd13be357-904d3cb8ed7mr1550360785a.9.1778192252020;
        Thu, 07 May 2026 15:17:32 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b986c371sm9463285a.2.2026.05.07.15.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:17:31 -0700 (PDT)
Message-ID: <967c1d96-9a48-48de-b7d9-58b63e782aee@riscstar.com>
Date: Thu, 7 May 2026 17:17:28 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
 a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
 boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, chenhuacai@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com,
 inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com,
 livelycarpet87@gmail.com, matthew.gerlach@altera.com,
 mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <1f34cbce-e2dd-4e80-b136-55d0efa50002@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B11384EFC49
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36418-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	NEURAL_SPAM(0.00)[0.661];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim,1c:email]
X-Rspamd-Action: no action

On 5/1/26 12:38 PM, Andrew Lunn wrote:
> Why not add an subnodes for the ethernet interfaces?

We will define "ethernet" devicetree subnodes of the PCIe functions
in the next version of the series.  Something like what's below.

					-Alex

pci@0,1 {
         compatible = "pci1179,0220";
         reg = <0x50100 0x0 0x0 0x0 0x0>;
         #address-cells = <3>;
         #size-cells = <2>;
         device_type = "pci";
         ranges;

         ethernet {
                 phy-mode = "sgmii";
                 phy-handle = <&tc956x_emac1_phy>;

                 mdio {
                         compatible = "snps,dwmac-mdio";
                         #address-cells = <1>;
                         #size-cells = <0>;

                         tc956x_emac1_phy: ethernet-phy@1c {
                                 compatible = "ethernet-phy-id004d.d101";
				...
			};
		};
	};
};


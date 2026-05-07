Return-Path: <linux-gpio+bounces-36374-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOwBF1eb/Gk6RwAAu9opvQ
	(envelope-from <linux-gpio+bounces-36374-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:01:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9D74E9C37
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E3CA3035256
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 13:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD6F3FB7FF;
	Thu,  7 May 2026 13:57:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438933F7A93;
	Thu,  7 May 2026 13:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162264; cv=none; b=C7Xi0dpaS+fHbsARkHUSqI2JjjMBMAMlvHWSZvOfy/QfObY/2lCvU+RmjoRTZY/VYvsYnGUgpsV6NbN2Ew6NWok1j2Ma8f64vfAoOMn+Br4wrWZQLjDVAEjewjs2TmK6ipN44BItOZmHsaYFKRjdl+V1H+3xeA2sJSl3KUahfJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162264; c=relaxed/simple;
	bh=RrvyEgcHRqqCMyU2TKBmBS7TG/av5sEF0ZDxFme6H7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AI6RyjRwNcXudRUIBvvn1L7VeIjaUgVEa6fJrRksUPU0vZuKfHzGL6+KFLWMZ+MHW1UpweRWNgHtdkx4v1xJ+3b+ICh1yzNH965r3OeC/0OdC11ZojEEjTOJViHDnLAPu7uoyIJPmbqEqRVKeN1jfKNKKBKy6wrZLQ+h+YaFRUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz13t1778162251tb46c22e2
X-QQ-Originating-IP: p1YkURIHeJrROEemiAkk20u/XtKBsAHtUI9xGIh+rLI=
Received: from [127.0.0.1] ( [116.234.74.217])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 21:57:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16399775298209443856
Message-ID: <3A5C0389E7C0D241+21a4f16b-1af8-46ac-8831-0c1b49694df0@radxa.com>
Date: Thu, 7 May 2026 21:57:26 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/12] net: stmmac: tc956x: add TC956x/QPS615
 support
To: Alex Elder <elder@riscstar.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
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
 <20260501155421.3329862-11-elder@riscstar.com>
 <DD71CDEABC7C16D5+02d052ff-13bb-4712-a847-91416f76c578@radxa.com>
 <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
Content-Language: en-US
From: Xilin Wu <sophon@radxa.com>
In-Reply-To: <7f3a0f16-5159-4bbc-8b15-9b5841603bf6@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M4KskqzZmkYy+CtMFd0wtJAPEtfXJ1C6cQnPhB+E3Wyt8z65shOIUuPY
	8fPhgltw0VSOiI8lWTRpbmL2XRSOBLkXTTrZoLsPDzhP8+yaaOY05Fz7uDkT5CYKinAnhUv
	POjyUcce8Cg1WE7qDEafq/6m2vM3rf/REiya/RO12HfujuuHDJ2hMnL0pe5FP9zTnOFOGhV
	hJftK21jwxsr1/HzlxkZ5NWpRvU6oD965eKJJe0cksbX7YKrJy9G7SEnYRoa4aRftEO8MVy
	2qwPOQAzTKnXjOfXay58q/NqwWiMVWUaiIzh1Qi0+MxIFuCWrAO9Po1MRE7A47axBlPdhUw
	Dn155ow1/NO4LogW7S3KIS2IgqhpQDfOmvEh14ufQDPJPSHdyeV6Jj0GEdC5GF40GvVZ6kZ
	IY0Bt/iL1VjL4GTd0JYq7Qc19fcvsW+MMCpXuvlvid9Lhs4QjCiyA7q8yySZOZNtcE0/ccw
	8jCdfLAKta3kJ+UYMX8LS8OiWLQfVtagxrpA3N0AiGojnVy2G1lyA8ZudsPHTjg1z9bz1nK
	T6ubH6EyO+W/TxRkuRcZJ00tRrvkwDzNL+zbFXRx6pcxW/oLEJNPGazlMhLpJ7ayP1Xzytg
	juVgILybDwBep8U5XjZEXAwuLwBjKLVShhgCmXRdBufIJJ99ncp9rN70pNtW5YonroML8up
	24HhBzeI8vwLP9mEzEZlncifswTi47B2/vE3VIwCUkPGfvqPspUJvg4UT43iBby/GYog+RI
	rTr3/q7VzeOKpIKr4e/sxJhdjA/Iy3CzPK8QHKLkxknYOFgrqjH4g65XiqUtquOLnc8RR9Z
	bfCb8eigZ6g7SLBg1KG40GYVGc8GBaVP9UsbwPXP/wjXI7D3V4QiyR6Qwp7oiVd1BvHZ2j3
	iYAxKnDDti+oPZJp4mX4yIHIvuE2i1as1zAg5MfVO/8bBIBt3hi9o6zyY8zV8umP8tp09xx
	IeDDzfDJzXrYjC9v2hT0upCx7it1wbnp57lAtw+2+qJiaQ1JDMM4OXjnLOBeM52W4k2l1I4
	EoVXwxc+smkt1KevVs
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: 0C9D74E9C37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[radxa.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36374-lists,linux-gpio=lfdr.de];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sophon@radxa.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[radxa.com:email,radxa.com:mid,riscstar.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/7/2026 1:44 AM, Alex Elder wrote:
> On 5/5/26 9:30 PM, Xilin Wu wrote:
>> On 5/1/2026 11:54 PM, Alex Elder wrote:
>>> From: Daniel Thompson <daniel@riscstar.com>
>>>
>>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>>> that can be accessed, along with several other peripherals, via two
>>> PCIe endpoint functions. There is a main driver for the endpoint that
>>> decomposes things and creates auxiliary bus devices to model the SoC.
>>>
>>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>>> MSIs.
>>>
>>> Add a driver for the eMAC/MSIGEN combination.
>>>
>>> Co-developed-by: Alex Elder <elder@riscstar.com>
>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>>> ---
>>>   drivers/net/ethernet/stmicro/stmmac/Kconfig   |  13 +
>>>   drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +
>>>   .../ethernet/stmicro/stmmac/dwmac-tc956x.c    | 791 ++++++++++++++++++
>>>   include/soc/toshiba/tc956x-dwmac.h            |  84 ++
>>>   4 files changed, 890 insertions(+)
>>>   create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
>>>   create mode 100644 include/soc/toshiba/tc956x-dwmac.h
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/ 
>>> net/ethernet/stmicro/stmmac/Kconfig
>>> index e3dd5adda5aca..66bcfaccbe21f 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
>>> @@ -404,6 +404,19 @@ config DWMAC_MOTORCOMM
>>>         This enables glue driver for Motorcomm DWMAC-based PCI Ethernet
>>>         controllers. Currently only YT6801 is supported.
>>> +config DWMAC_TC956X
>>> +    tristate "Toshiba TC956X DWMAC support"
>>> +    depends on PCI
>>> +    depends on COMMON_CLK
>>> +    depends on TOSHIBA_TC956X_PCI
>>> +    default m if TOSHIBA_TC956X_PCI
>>
>> Hi Alex,
>>
>> I think GENERIC_IRQ_CHIP should be selected here.
> 
> Yes there are a number of things missing in the Kconfig definitions
> and I'm working through them this week.  And yes, since we use
> irq_generic_chip_ops we must ensure CONFIG_GENERIC_IRQ_CHIP is
> enabled here.
> 
>> Thank you for the driver.
> 
> Thank you for your feedback (this and others I see).
> 
>                      -Alex
> 
> 
> 

Hi Alex,

Do you think if a shutdown callback like this is required? It looks like 
the driver sometimes does a MDIO MMIO read when the PCIe link is down, 
causing the board to reset due to SoC side PCIe NoC timeout.

After this change, the board can always shutdown gracefully.


diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c 
b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
index 4e8b4a185583..34b8e3fe1b51 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tc956x.c
@@ -767,6 +767,17 @@ static void tc956x_dwmac_remove(struct 
auxiliary_device *adev)
         tc956x_mac_disable(td);
  }

+static void tc956x_dwmac_shutdown(struct auxiliary_device *adev)
+{
+       struct device *dev = &adev->dev;
+       int ret;
+
+       ret = stmmac_suspend(dev);
+       if (ret)
+               dev_warn(dev, "failed to suspend MAC during shutdown: %d\n",
+                        ret);
+}
+
  static const struct auxiliary_device_id tc956x_dwmac_ids[] = {
         { .name = TC956X_PCIE_DRIVER_NAME "." TC956X_XGMAC_DEV_NAME, },
         { },
@@ -777,6 +788,7 @@ static struct auxiliary_driver tc956x_dwmac_driver = {
         .name           = DRIVER_NAME,
         .probe          = tc956x_dwmac_probe,
         .remove         = tc956x_dwmac_remove,
+       .shutdown       = tc956x_dwmac_shutdown,
         .id_table       = tc956x_dwmac_ids,
         .driver = {
                 .name   = DRIVER_NAME,

-- 
Best regards,
Xilin Wu <sophon@radxa.com>



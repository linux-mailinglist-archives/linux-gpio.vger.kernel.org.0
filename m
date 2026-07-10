Return-Path: <linux-gpio+bounces-39855-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aOW8M/1MUWpxCAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39855-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:50:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66C73DF2A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 21:50:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kwiboo.se header.s=fe-e1b5cab7be header.b=AvmtNw24;
	dmarc=pass (policy=quarantine) header.from=kwiboo.se;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39855-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39855-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D53ED303A65F
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 19:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9610D38F233;
	Fri, 10 Jul 2026 19:50:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BB033A6E9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 19:50:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713010; cv=none; b=cFPYTYJXEjs1QgfGZphEwV8sLk6SbmS03qpEJQzkIcFzB+AHxIoE0SykHj/4tiLP9HmronrP1+82y0K4agkPj1kLUgP5VzPZdDUJYvBI72ILfFjx1YnPn8QDApH95EduVuuJQiejUjHgMVRPVM4UEvFK9XYfmTcoc1IGue8CrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713010; c=relaxed/simple;
	bh=WucpsYI69zUjxgCnQpH7VeayPXFlu3a6JmojAh0xuXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgbGxHa4f4hfq1rTBJHJff6GgYHsCMyJm+Vw9oyX0TtfBzRDagaU507FqpJhkKd95i1p626qdK6FN/Ndh477D5PMZz3qV3smuX+FaWOiPwiIOyptwqnl6FGO8+KSyAPljG7lt4LFsPz/sfYVes82T2OddkDawBWjunojRHFmCBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=AvmtNw24; arc=none smtp.client-ip=149.28.215.223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1783713007;
 bh=G97p3I72zO6HSzwQX3GsrN/RHi2gmwpFncs/h5lZiNA=;
 b=AvmtNw24ODMRQgcUsgrZ7N+tCJBuHFhayq45BRVMl1Xo5d4vbs86pmwdKZSOckOZiuI/oTwEH
 rVkhK6dHYeISZQTQpOU5kxD0u+kCcA8dkSGF6ycyGnKrdblxjbx9jPiDLzNc03WTZfpYdsG1q/A
 90AokbF0d9kuVtRxLZIxKL58VISZrsk7rR7P2YBrJNgFNO/NULVoH83fIIyKed95WJhU9YDYLQu
 hT1iO40uS6MJVeTMJ+EiIg+Qt6iyMxNKOCyW3YZ+trmiXxrzEmBzmNauhh0knPeBsLBodkW3mDu
 60hNCN45pom5vupAq97DWm9pe2oQKrXT89VSi/gcP20g==
X-Forward-Email-ID: 6a514ca876cf32b2f5f788d4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2127e98d-d411-4be9-aac0-bc3684339faa@kwiboo.se>
Date: Fri, 10 Jul 2026 21:48:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] dt-bindings: pinctrl: rockchip: Add RV1106
 compatible
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, huang lin <hl@rock-chips.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706195818.3906949-1-sjg@chromium.org>
 <20260706195818.3906949-4-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260706195818.3906949-4-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39855-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sjg@chromium.org,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:devicetree@vger.kernel.org,m:festevam@nabladev.com,m:linux-arm-kernel@lists.infradead.org,m:conor+dt@kernel.org,m:jeffy.chen@rock-chips.com,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:hl@rock-chips.com,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B66C73DF2A

Hi Simon,

On 7/6/2026 9:57 PM, Simon Glass wrote:
> Add the compatible for the pin controller of the Rockchip RV1106 and
> its RV1103 package variant.

The RV1106/RV1103 has a dedicated GPIO IOC regs block for each GPIO
controller. Something that seem to be different compared to other
Rockchip pinctrl/gpio controllers.

I think we possible need to have a rockchip,ioc or similar added to each
gpio bank for this variant.

Address mapping for gpio controllers and ioc regs.

  GPIO0		FF380000	32KB
  GPIO1_IOC	FF388000	32KB
  [...]
  GPIO1		FF530000	32KB
  GPIO1_IOC	FF538000	32KB
  GPIO2		FF540000	32KB
  GPIO2_IOC	FF548000	32KB
  GPIO3		FF550000	32KB
  GPIO3_IOC	FF558000	32KB
  GPIO4		FF560000	32KB
  GPIO4_IOC	FF568000	32KB

I even made a note of this in my mainline U-Boot tree at [1]:

  FIXME: range overlap gpio2+, u-boot pinctrl driver
  fail pinconf of gpio2+ unless regmap cover all banks.

Something I simply ignored at the time when I played around booting my
RV1106/RV1103 boards using mainline U-Boot. However, this is something
that should be fixed in a proper way for mainline Linux.

[1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/arch/arm/dts/rv1106.dtsi#L130-137

Regards,
Jonas

> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 9b3cbeb54fed..81747bb53056 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -51,6 +51,7 @@ properties:
>        - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
>        - rockchip,rv1103b-pinctrl
> +      - rockchip,rv1106-pinctrl
>        - rockchip,rv1108-pinctrl
>        - rockchip,rv1126-pinctrl
>  



Return-Path: <linux-gpio+bounces-36376-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOd/DFyf/GkMSAAAu9opvQ
	(envelope-from <linux-gpio+bounces-36376-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:19:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C42224EA014
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 16:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0112B308E6F8
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 14:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23AB3FF880;
	Thu,  7 May 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pci39C5h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BB73FCB1C;
	Thu,  7 May 2026 14:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163162; cv=none; b=u09N4nL2LIaF2GFF/kauL43UZp4cb9nQQzMjjYMtvOPivgeaNNSZ55FCjqr/345e7mGeM0vcnV+n/1qUeqjK0BIvc8MS+wZd+fusUUrkbCQ7y7xezT3wDM2AB2jGyy29Vea3ntg2ry71hBnIfhtbOTTkspfP7A7VyQr1Q91Fjd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163162; c=relaxed/simple;
	bh=huVUPART2jTXeXW7K4I2VW/dRB4xvecgCc0kX0CTQBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fkQ0XrdqQ4ndLTcWXslhnmkB1va8KJaommv/VcPCVhLWWASxCOorVJ2xW4qvZTYRtQaPWM62bhKyvhzSPjfhtfAq0VK95cqHOO7dVEUF3sBxDDrTRbOar/aA+W8JxypFxflFQ3J/Nw6wOvLo6Uy6I0VpXqL+Lbjf80yJJCkQFrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pci39C5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85F3C2BCF6;
	Thu,  7 May 2026 14:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778163162;
	bh=huVUPART2jTXeXW7K4I2VW/dRB4xvecgCc0kX0CTQBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pci39C5h/cOMDDSO2oyymDLmiaq4ZXMfTibB/Yg4C+bcbVk+Q7SOTDWci19669I7T
	 9DRuDg+kLVm26zNKDuYWGMP56moGFlMngR20Oc2KrpjuGsyRYA39Ya97CyZ0dOD6Yr
	 kKs5XXs7HqJ7YCnnDiONnBAWOLXw83TvgY3+OgRwNdz54SXaZvtieYsBZ/EsRBvx8X
	 TkEtq++dws3GH2BDJewPUQajhV+rRb1OtYZCisTi27/2lezWaedJa3IfS2WWcwju3t
	 1MvkDZX8t/0H9nMbeMR/1+xrr8P31LyvlRcDl+Q8C/vPoKzp2V2543XWpdh1c46d3P
	 B9j8Hy77aZRfA==
Date: Thu, 7 May 2026 09:12:33 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, Daniel Thompson <daniel@riscstar.com>, 
	mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com, alexandre.torgue@foss.st.com, 
	ast@kernel.org, boon.khai.ng@altera.com, chenchuangyu@xiaomi.com, 
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org, hkallweit1@gmail.com, 
	inochiama@gmail.com, john.fastabend@gmail.com, julianbraha@gmail.com, 
	livelycarpet87@gmail.com, matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, 
	me@ziyao.cc, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	richardcochran@gmail.com, rohan.g.thomas@altera.com, sdf@fomichev.me, 
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com, wens@kernel.org, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 08/12] dt-bindings: net: toshiba,tc965x-dwmac:
 add TC956x Ethernet bridge
Message-ID: <afycOwz5TpkegkZd@baldur>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155421.3329862-9-elder@riscstar.com>
X-Rspamd-Queue-Id: C42224EA014
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36376-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,netdev,kernel,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
[..]
> +
> +  gpio-controller: true

I don't have any concern with the use of a proper gpio driver to model
the implementation, but if I understand correctly this relationship
between gpio controller and gpio consumer is strictly internal to "the
PCI device".

Is this connection variable or is the link merely expressed in
DeviceTree to mitigate the fact that you choose to implement the
responsibilities of the two parts split into two device drivers?

Are there other consumers of these TC956x gpios which would result in a
board designer (and hence dts author) to ever reference this
gpio-controller in a different way?

Regards,
Bjorn


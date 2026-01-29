Return-Path: <linux-gpio+bounces-31307-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPffLz6Je2mlFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31307-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:22:22 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D59B21C8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 927AC3025D1E
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 16:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E1833EAF2;
	Thu, 29 Jan 2026 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRpxmjrr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FB33E35C;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703461; cv=none; b=r/fmuRy1B4Bts/fM68fdFit8msH0jt7A0kL6BB5las12I4Not7pwdtnU5pTJ4QoDMwWHQsBzrdRvPMK8zeC8YPKCgBO1jK24TZDi1lkJUE5meadGQq2Xh3JQfmyfVFeVr6gpJgNer1HlMx38IRYNBUpbl5OaX61mwPLzca5aWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703461; c=relaxed/simple;
	bh=KufZgQNtbJ6Ya6x3/R6zEkba70EXrw7je3QvW4vFFRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgRSq5AkeMMUxn0SKc1hbrOkyeNuNGcK8Bmp2O02QAOHtU9qzmc9hNXf/LAWxuPS3lR61nc4+hdwollOHkCQEsNKzPeoHoUskqpbjap+cjpvSYtBNuME+WH6jKm4sme8Uq7IjYRvkUdyCZxJBGgQ8L48VT8tF+4qYdzPdAst7QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRpxmjrr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540E4C116D0;
	Thu, 29 Jan 2026 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769703461;
	bh=KufZgQNtbJ6Ya6x3/R6zEkba70EXrw7je3QvW4vFFRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jRpxmjrrdvCr2X0JY8D+iNKWMd0TgpUAgpcjqDJdnnHCj79z3ve+YVyGWVAl+EZ4f
	 bgZ5lzWL3umobnDZm7u+tcHgD8D42LNUpP/RgTfBu/YY7YDqi+2QSezQy/3ZOqbf7j
	 qnk+YmBc76ILBd50OGuUCF8tVvlHDs2AsuwZD0yhnEA3q83wltK/weBc/WQXeahhWq
	 KdScsviIDmU9Wd2JCBzQtof7DILvMUjedsLM/VHtm71hvdEz5dMA0uo5yVzda62Heh
	 q0VfrBCl7kNNe470XTK2RMjUFgDbc0XIftaCogzb0u3Z9MbXeJd4Y5TCNzYUCuD5qx
	 twYWoHNUlcFJg==
Date: Thu, 29 Jan 2026 10:17:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	jens.wiklander@linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	coresight@lists.linaro.org, Linus Walleij <linusw@kernel.org>,
	devicetree@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@linux.dev>, Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: bus: document the stm32 debug bus
Message-ID: <176970345958.1208851.15019690954593633127.robh@kernel.org>
References: <20260123-debug_bus-v5-0-90b670844241@foss.st.com>
 <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-debug_bus-v5-3-90b670844241@foss.st.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[foss.st.com,linaro.org,kernel.org,gmail.com,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org,arm.com,linux.dev];
	TAGGED_FROM(0.00)[bounces-31307-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,st.com:email]
X-Rspamd-Queue-Id: 23D59B21C8
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 11:39:00 +0100, Gatien Chevallier wrote:
> Document the stm32 debug bus. The debug bus is responsible for
> checking the debug sub-system accessibility before probing any related
> drivers.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



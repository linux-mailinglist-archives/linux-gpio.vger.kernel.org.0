Return-Path: <linux-gpio+bounces-32731-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDnNAhpHrGmloQEAu9opvQ
	(envelope-from <linux-gpio+bounces-32731-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:41:14 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685C422C7C1
	for <lists+linux-gpio@lfdr.de>; Sat, 07 Mar 2026 16:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89A093018745
	for <lists+linux-gpio@lfdr.de>; Sat,  7 Mar 2026 15:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DC23A257D;
	Sat,  7 Mar 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sgqp+28H"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C132D77E6;
	Sat,  7 Mar 2026 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898068; cv=none; b=qCqmYFrwB7HkBJogQCh364bOSy1B3NmXsBEOpsjVYiXSY0QNCF9i/0Pd1vvYS3d4x0YKdEu/q0vHv7QlV5bcb57Q/ER5h5AeAXQ5QOBliRx1qHpXDZS+Q/GQQwCJdRVptqpGF1o/pfQi0I3nW/LlBppTkjoFCDXFeZV6wXJNogk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898068; c=relaxed/simple;
	bh=f+VINfj30sRD5d1VtokdWX86fVCDbmqN3C1dnxzpYNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmJrfZ1cS+qU5Q0igCvqchPR0NSrkb+OwnI8rC0H87gnBQgc+gmec9MhnQ+skZESichwjea52y11lmdU+a5HF77DuALEb6ecsK7mj4mtUGSc7fpKAXy/zXKyW2boOiA5ejJf90AzsTk7ZLsP/NJHKfAEgeel+zOUmr4v6f2wD/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sgqp+28H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4607DC19422;
	Sat,  7 Mar 2026 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772898067;
	bh=f+VINfj30sRD5d1VtokdWX86fVCDbmqN3C1dnxzpYNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sgqp+28HRdDN0PvuTh1W2Uw8yhl0iSfX/7blmZYkvTwt2oEGFBNW833PB63sG2xqU
	 7st9Jf7sE/QhirNBOP936QBObGQSdZeGMxAw1LTVWd5tzV0bxf6qQ8VAYNH/X2NhgS
	 +eNjWsCVfVgggdSHgbfQaiaF9eYKrfLPz5BCQzVJzzJxncLq33Yc5DOgYot61dtLts
	 njrruI7dXhoDZudHNZaSDHSij8E7tJm38L5d8pAIdAEjo/fkrt47LyUewjExyHFkwk
	 CWkU2Ah4HyNGekSq0q64w22M3LVz9soG2dAcV645tXPgWO87gP+/SJwE//ZEbWAkT8
	 cXA9ePgry+65w==
Date: Sat, 7 Mar 2026 16:41:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: defconfig: Enable Milos LPASS LPI pinctrl
 driver
Message-ID: <20260307-tan-dalmatian-of-atheism-e6625e@quoll>
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com>
 <20260306-milos-pinctrl-lpi-v1-3-086946dbb855@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-3-086946dbb855@fairphone.com>
X-Rspamd-Queue-Id: 685C422C7C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32731-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 03:22:17PM +0100, Luca Weiss wrote:
> Build the LPASS LPI pinctrl driver as module, as required by devices
> using the Qualcomm Milos SoC.

", like foo bar."

Because if we don't have such device with audio enabled upstream, why
would we want it in defconfig?

Best regards,
Krzysztof



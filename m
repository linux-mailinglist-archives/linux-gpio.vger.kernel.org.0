Return-Path: <linux-gpio+bounces-39589-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jii/AnEBTWp3tQEAu9opvQ
	(envelope-from <linux-gpio+bounces-39589-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 15:38:57 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D2371C024
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Jul 2026 15:38:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DrkBnN6j;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39589-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39589-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A0C130E26C5
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2026 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9205841D4F6;
	Tue,  7 Jul 2026 13:31:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466B241C303;
	Tue,  7 Jul 2026 13:31:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431112; cv=none; b=mWJ3Y7febxNvgzSSRYEXHiBk3gqJConwCAgbDR+ZXuyHzpPA5f3i++EteXylzYvuIC7kxwcKlRMwPXFkxj9BhAnWzwYyocx4E6xBcpox2+/XnWcdi7BA80gT7ZF7QbGIn49l4jLTvhgFdb1Xp244no5li+YmYNZ35+JN37FycRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431112; c=relaxed/simple;
	bh=hi/Y+A3iq1QCnEQaABM1Al+dWo3tQdQQkvsTHsJHAPA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oOjl/TFlga9oKp9dpijiF7bH7diVEvxZC5TWdScLKWDRHuR9ITdV8MFdl0Z+KeVFrGrhHvdUl+W4XRBytdhaZJeY4tGOjqT8UqyP1Jn9lCvQmsjaJKjnJP6egk62/10mh9MXEgYc/tFC0LA8TfNWE8PyleWdBuer7IDzzYtXNnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrkBnN6j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9E41F000E9;
	Tue,  7 Jul 2026 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783431110;
	bh=ECOtrfboglA7MkJelsbi7HV7rJGyEpwDPz5UHei8RS8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DrkBnN6jqvpb8+cx21YZaMG8fQmC584kQsNB2GTUBNe6ad8k6jjfxmX67n3DBmhuy
	 AdlO0ojwGgFnJgRZhegI7+/V+K2BPKuz0jd5ih8BDy6UTTzWr4ez3VdKvK0ujffn5T
	 IqBIQtiDPpd4XIWtrM8AsG92dkXtG6zzMHe6PjxdCDA93fJeJrBjY6I5dPswrpaB0a
	 V35WD4/2vuucynF7HGlRyMe2OD60yLnGRSq3pFi/LHhlnwxDN6rhSzx57wG8hzSlMs
	 75/orX+wl3LNSKDTks1QSHUAJ6dg+VoZXRllohql0W1+FnMtX8wM2y/JzelOiwLIMT
	 sGB7y5SOGUzSw==
Date: Tue, 07 Jul 2026 08:31:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 mohammad.rafi.shaik@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
 ajay.nandam@oss.qualcomm.com, Luca Weiss <luca.weiss@fairphone.com>
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
In-Reply-To: <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
References: <20260703073029.2588960-1-ravi.hothi@oss.qualcomm.com>
 <20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com>
Message-Id: <178343111013.2437204.2936966826993460040.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: pinctrl:
 qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39589-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:andersson@kernel.org,m:krzk+dt@kernel.org,m:devicetree@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:ajay.nandam@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:ravi.hothi@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82D2371C024


On Fri, 03 Jul 2026 13:00:28 +0530, Ravi Hothi wrote:
> Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
> Eliza has the same pin mux functions as Milos but uses a different
> slew rate register layout where the slew rate field is in the same
> GPIO config register rather than a separate dedicated register. As a
> result, Eliza only has a single reg entry instead of two.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---
>  .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf: [{'const': 'qcom,milos-lpass-lpi-pinctrl'}, {'const': 'qcom,eliza-lpass-lpi-pinctrl'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260703073029.2588960-2-ravi.hothi@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-gpio+bounces-31245-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDTbKz0RemnH2AEAu9opvQ
	(envelope-from <linux-gpio+bounces-31245-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:38:05 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE5A238C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 14:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E9CD300795C
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Jan 2026 13:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB04352C41;
	Wed, 28 Jan 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qWURFtou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98218A6DB;
	Wed, 28 Jan 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769607482; cv=none; b=HkDhv5q+va9/6m264Ih5oe9ALDOoBw1/h/nYakdSX1sKC3nP89jk5HWA0HxJtiZITrLN0HZ5xkJKBSLtOWr8WTH0wOiCtB9DOc03XrwmHPrUUWCeZGDeJ3Va46l0VvXD6qBWuXJWN03SI/ifhBKkQVX7zvqSmZvSfv3wnWnKyno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769607482; c=relaxed/simple;
	bh=W6Fc1Mu9+tpq58h5Q4y557wPm9Wi/+NTXKzdhMGz5TA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=F0SR2M1Y01qBAJpLW/uCRJHcpiA6AfMdkR5PWHzo0mh5EVeh4gXNCZlbDxhgLrDsHPwb7nvo1oANDXMRZ5i+7Gz8Jj+zSLwg8xwpXMBOOYVCzoP1vXy+uuHqSdHuajfd4Tq0d5NHvbestkMWqKQQr6yRSmQ7LlVd0DqCelRA8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qWURFtou; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5B4C4CEF1;
	Wed, 28 Jan 2026 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769607481;
	bh=W6Fc1Mu9+tpq58h5Q4y557wPm9Wi/+NTXKzdhMGz5TA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qWURFtouvAO2vticWoVwmFcAWQpSYbqGkuGUOSfAvNN92AeIFS7/oxKWYbE6Jg9QY
	 QZsLo0vh3KE3pYGOTUF29mAB1Gpgn+OYNuRxKuwNv+VRGWS5xd8CoaH9o+cebzsQna
	 NzlLvFkdKF9JV6HYkR6sEqICqfH//gP7V6NQn64JTNdBXjsadeHbUiAp38u+EktAne
	 rJtxzLLaRYTEX3yb+IhMXEelPymK7TvRs+4+qdQi8CCNJjiqGpcCFLaN9ygq2J+ewf
	 pcP5S5J7UMsS7cKkSIfIwA6RDtzpenuT/eCqWWoq1PRVEkSGlYfqsm7PAyfqo3MpRK
	 J38kmLtGEOx/g==
Date: Wed, 28 Jan 2026 07:38:00 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
References: <20260128-sm6350-lpi-tlmm-v1-0-36583f2a2a2a@fairphone.com>
 <20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com>
Message-Id: <176960748074.1497503.9897313421386306393.robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: qcom: Add SM6350 LPI pinctrl
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31245-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 2DAE5A238C
X-Rspamd-Action: no action


On Wed, 28 Jan 2026 13:26:49 +0100, Luca Weiss wrote:
> Add bindings for pin controller in Low Power Audio SubSystem (LPASS).
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml     | 124 +++++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.example.dtb: pinctrl@33c0000 (qcom,sm6350-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('i2s1-active-pins' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm6350-lpass-lpi-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260128-sm6350-lpi-tlmm-v1-1-36583f2a2a2a@fairphone.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



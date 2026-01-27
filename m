Return-Path: <linux-gpio+bounces-31157-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPNRDySueGlasAEAu9opvQ
	(envelope-from <linux-gpio+bounces-31157-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 13:23:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9A94419
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 13:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AECE7302C6EF
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 12:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05E234B42B;
	Tue, 27 Jan 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ipJeUGXH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEE2FD69E;
	Tue, 27 Jan 2026 12:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769516363; cv=none; b=tg+bcMogRXU63UL3xiYlC+zy3tov0iqY6+UeP8jBcQNM3t3dd4fq24g7VxplYYVyLjjjefAKe3/KPuBgHF/q+S2naOTG3ZU4PQnkMewAlzuZ/1YJUKj7dBy+BAK/I4Jfi0Nf7lCr3klPJcY70mVQ/JYX6Ulk3ETbyljlf6h6T/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769516363; c=relaxed/simple;
	bh=rQCwqPRjnf0sF73dqDqtjnGlhCpJA0ASbwQRPJhgCy4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E7ygBltMS8miEqMLTbsgmqK7VF/IF2BH1zAcFscPUcFSRnKRu8soMPdAIyUG+9lwtVGO4CVy7dtpDxEdxZf+Eb9koXwqnQwK4IozFEoqX7DWXw+DHD3eMj+CgMhQP32km4uFW0cv01nWjyTKRVdZGeN0EEaD03M20+7Km44lcis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ipJeUGXH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17668C116C6;
	Tue, 27 Jan 2026 12:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769516363;
	bh=rQCwqPRjnf0sF73dqDqtjnGlhCpJA0ASbwQRPJhgCy4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ipJeUGXHjTvkf+dK3RXqE6BfkkGafy5VkltFiWFLtMrsXPgFOUkFFWWVj7WQu8Ka/
	 x08w8beaEQcZZnaNcM9hQxjxsEhSwiRfJIhvO6JLofyklxAmQV5Xk6NqmAaIHvovWO
	 LqKER0LuR7UdUIqBaWX1nukFj9dfqHbu2o45EDqr4nCrtOm3KAtN4Ph7NZPLBJDzeU
	 Bk+5yJ78ywtODuOz28E3nKeyG+WndpSu3MncmXIhklPEagdq0JPi90E+yzudQoKIs0
	 arSYKtGrWUmNO4qI5uGL93jnGVyBQAmXiGIAKiMN5j8NQ3aqU9ISlSm2jsWHWPcgny
	 ehvlOSBOoEqlw==
Date: Tue, 27 Jan 2026 06:19:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-gpio@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
Message-Id: <176951636220.1230755.4335541729269457450.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl:
 qcom,sm8450-lpass-lpi-pinctrl: Add SA8775P and QCS8300 pinctrl
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31157-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 92B9A94419
X-Rspamd-Action: no action


On Tue, 27 Jan 2026 16:25:11 +0530, Mohammad Rafi Shaik wrote:
> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
> pin controller, fully compatible with previous SM8450 generation
> (same amount of pins and functions).
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
> changes in [v3]:
>  - Removed the duplicate driver code patch as suggested by Krzysztof.
>  - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
>  - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> changes in [v2]:
>  - Fixed dt-binding errors reported by Krzysztof and Rob.
>  - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
>  - Documented Monaco compatible as suggested by Konrad.
>  - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
>  .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf:1: {'items': [{'enum': ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sa8775p-lpass-lpi-pinctrl']}, {'const': 'qcom,sm8450-lpass-lpi-pinctrl'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml: properties:compatible:oneOf:1: {'items': [{'enum': ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sa8775p-lpass-lpi-pinctrl']}, {'const': 'qcom,sm8450-lpass-lpi-pinctrl'}], 'minItems': 1, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



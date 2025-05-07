Return-Path: <linux-gpio+bounces-19761-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D064AAEEF9
	for <lists+linux-gpio@lfdr.de>; Thu,  8 May 2025 01:07:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8AD94A704B
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 23:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC7C28E59F;
	Wed,  7 May 2025 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eKp+AcOh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5F1E1C1A;
	Wed,  7 May 2025 23:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659231; cv=none; b=HbYeUuLYbVbmDeVz5fhacVLBrd6N+7SsZzw74nvCS16buryxOyTRGcJ7BN/E8U3id9io1VCh8SWnVYYjZ6zSNI5S39IkzHmigFSmt2j/upY22VQR18Q4sLmNpcTiHpR5JuROYFkwrpaihTxMGRF2nl2Sq7NpBojqH1QtDjNAMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659231; c=relaxed/simple;
	bh=kowzluapG3MSh9AZGkanLQ0O4GtMg+6T1JAjxCMbNls=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MPbyanYixapY2dMdogKUMfyDRrTpqcF65xdIJHLEp0dY93dWCGjm6luKVPfCrD+mNvaIv5JDI210eaDcexaIqHCCmRb+HI6jSV6/Fr2ZBAZ6Oc/IqIpiN+hmipbyIhoIpLlHfykpogpPd2R/CoJX3AV8iPqicA1L5Lr8mpzkhgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eKp+AcOh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC7BC4CEE2;
	Wed,  7 May 2025 23:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746659230;
	bh=kowzluapG3MSh9AZGkanLQ0O4GtMg+6T1JAjxCMbNls=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eKp+AcOhgSWxjgv9mFidR+urP+yGFCMhatyj7ZCInpUNJoblKelkwKObkqUowX+eM
	 UlvwxMFGDKiQXxnSFihcOagaNKvxTtbcAuK2YVvFIQVVF/mI/IWkrvbemIGGAUDgFc
	 l1Mz0+dM5jNZ1wQ0376XLn9riuMKrsVIE1qrjBvw0a9Bh9guWyd/nEji3CwzNVy66w
	 +k04OImsNzWKhtpAr1EH/QoIAR6ynDV1e6ShzmhTxRYuCyr9fbnSrDYV/wBhboHZD4
	 ZmcStZ9MRzIMiKPEwRFIZ+Aej+x89pxRGnDkdf1remWILZymXd/kmm2A5tGeXcJoTG
	 FJiiNpA+PjVKw==
Date: Wed, 07 May 2025 18:07:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>
References: <20250507215852.2748420-1-robh@kernel.org>
Message-Id: <174665922697.2893748.11935723086658329970.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties


On Wed, 07 May 2025 16:58:51 -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250507215852.2748420-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



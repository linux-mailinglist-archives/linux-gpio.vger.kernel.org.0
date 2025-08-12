Return-Path: <linux-gpio+bounces-24312-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36115B22AC8
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 16:38:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2DE3AA480
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Aug 2025 14:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7DC2EB5C5;
	Tue, 12 Aug 2025 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aknfxh3m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B02D8377;
	Tue, 12 Aug 2025 14:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755009166; cv=none; b=miBaOovlro0T9eLyKoFL68zR/UszfNU8gGuBzzZRmu9FbfeTJF6cGOLHEzNvW9YwlNhoccLo8+6pSsn1AhgjkOlRFQrcmkDh8+qm51LN0Evq9DjcZmGKrS5SPW6t0SVnG0iHnetLY0uFiG/I0/qzgzEwxHWKZIU6H661vHbnvZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755009166; c=relaxed/simple;
	bh=fy2/TnxpQCa912cSSfOH0Jy+C/EZqNdGuJwRBGssE/M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=aqrMh2vZ8/UWdGhJ+Chd2/CYCqpMHn5d2pkdcow5ogSr3AfhV5QaP36YcPJt/sZ/MHcFYn+6LGZtUtKaNZv7+gi+7n/7mWO+vz5fcDWW5Tc9PR9qYjN0uvksFkaHjpSOta/3eK0S7/WdOxzp1Xcjwi/JV0vJ0PVo/kOtUNXdDHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aknfxh3m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8632BC4CEF0;
	Tue, 12 Aug 2025 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755009165;
	bh=fy2/TnxpQCa912cSSfOH0Jy+C/EZqNdGuJwRBGssE/M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Aknfxh3m9XKnn6/bFwYil95p5Oh1ky5mRX2z9Y7vzkTKQ/AHKRCTvEQMHpmkXm+Tj
	 RVlRERrOzBPUqwUL+dGLwUyyrGgZbd9w4UcJkBgfk5a49SLvrgo4H0XliowoCGFGC6
	 DqFwhS0ArYrsVlaU+Q7LKT1LZIe9SqxuzePXerFg39PBZxbaxUayacfXEt2YotHuvP
	 zyUNCJ7tnCProE7MW2ExXNDMFfk/Wk33sz1iJ9srNdOuspXxEHc/XEZVMZfvInlCn4
	 Xzna/m5QVKMOsKJkfvT5T8PidCMkD8f/LXZaVBtG4cMl4TnVXcUbl+BSJ5LHxC7/EM
	 gnsNMKui+Xhew==
Date: Tue, 12 Aug 2025 09:32:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 Qiang Zhao <qiang.zhao@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
 <0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu>
Message-Id: <175500916432.3488674.1706766155168772227.robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports


On Tue, 12 Aug 2025 13:02:54 +0200, Christophe Leroy wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it for that those IRQs can then
> be linked to the related GPIOs.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml:3:1: [error] missing document start "---" (document-start)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml: ignoring, error parsing file
Traceback (most recent call last):
  File "/usr/local/bin/dt-doc-validate", line 8, in <module>
    sys.exit(main())
             ^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 66, in main
    ret |= check_doc(f)
           ^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/doc_validate.py", line 22, in check_doc
    dtsch = dtschema.DTSchema(filename, line_numbers=line_number)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/dtschema/schema.py", line 83, in __init__
    id = schema['$id'].rstrip('#')
         ~~~~~~^^^^^^^
KeyError: '$id'
Error: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dts:34.3-35.1 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:132: Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1527: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/0b56ef403a7c8d0f8305e847d68959a1037d365e.1754996033.git.christophe.leroy@csgroup.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



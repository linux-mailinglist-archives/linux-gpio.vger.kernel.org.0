Return-Path: <linux-gpio+bounces-17316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B555A57DE4
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 20:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A7716DEC8
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Mar 2025 19:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF3F204C0E;
	Sat,  8 Mar 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkLZMjRU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1547F382;
	Sat,  8 Mar 2025 19:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741463979; cv=none; b=Cu7f/N+aPGTeGPBcIC8+dnEp41LDjYh9T9CGDZsNUb7qbuJlUQS3M59Fyk2vJpbqQdVQol5XLAse8DIx6ybz3wcPU1Z5tHl/+jG7Jr1R/356dcXwDbERl1tR7+ivUmddqD1nyiuPQj5Uwgh15NMFGUi7OucoZ8OlwN/jXPNPeh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741463979; c=relaxed/simple;
	bh=x3E1fq8IZUwU/fUF2C5GTmbaJW+Wcl0XpQM85Bz+Stg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=FM+QJj9GaDvTHcUBhem+A74d6eoQclAPI5JArJci3z9DWR0hUFqaYuv87AwetEs+OUTGclss3hEzpVYIW0x0CDJhKoI01Mll9l/jZhjwXAzNgSvjxFQtYdZcRMeOAd88NtZ2Lgt+naI0bcV3Eatr8yYxo7NbCNR9oYqE1XCxr+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkLZMjRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5CDC4CEE0;
	Sat,  8 Mar 2025 19:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741463978;
	bh=x3E1fq8IZUwU/fUF2C5GTmbaJW+Wcl0XpQM85Bz+Stg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hkLZMjRUhZKV6eypsedqDvbQn7W1IHnBcglKkq/TE5/sFLtFpOheLF6YwiqIzy/9d
	 reFkhemx4IRp/QKuwZXOGfn3ACLxmKqii8mD/5F9Fk/kRySyD+yk1Zi3a54/Z7piU/
	 +vQjmu6fqSFGluVC94BAGLKsQs+WUZ7FWol7WwoHzr9CIxC+JyAaNA8+XoocHR+4M8
	 WZxWCwk8GrNM7KFNIwbK+saC16tHOFij1wRXem+E0XOM/RZxn2v4wLfVqjnsA+HGoo
	 oJIWGgqLxyz2ctbI7vlOw6dGHsHCq7kmZVQUXVa09oWQ35m5OyNjet/t44zRZf+MTs
	 YLZrMGE3ieZ7g==
Date: Sat, 08 Mar 2025 13:59:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Eric Biggers <ebiggers@google.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 Ihor Matushchak <ihor.matushchak@foobox.net>, 
 Ricardo Ribalda <ribalda@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Umang Jain <umang.jain@ideasonboard.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dongcheng Yan <dongcheng.yan@intel.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-staging@lists.linux.dev, 
 Tommaso Merciai <tomm.merciai@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Taniya Das <quic_tdas@quicinc.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Conor Dooley <conor+dt@kernel.org>, Zhi Mao <zhi.mao@mediatek.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Will Deacon <will@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Ross Burton <ross.burton@arm.com>, 
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cosmin Tanislav <demonsingur@gmail.com>
In-Reply-To: <20250308183410.3013996-20-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
 <20250308183410.3013996-20-demonsingur@gmail.com>
Message-Id: <174146397700.3496940.17285353944853657369.robh@kernel.org>
Subject: Re: [RFC PATCH 19/24] dt-bindings: media: i2c: max96712: add
 support for POC supplies


On Sat, 08 Mar 2025 20:33:48 +0200, Cosmin Tanislav wrote:
> The GMSL links can carry power to the serializer when using coaxial
> cables.
> 
> Document this capability.
> 
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml: patternProperties: 'port[0-3]-poc-supply' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250308183410.3013996-20-demonsingur@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



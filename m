Return-Path: <linux-gpio+bounces-11756-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 249AE9AB083
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 16:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E750B284342
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 14:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622A51A00D1;
	Tue, 22 Oct 2024 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7s1WI6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16167126BF2;
	Tue, 22 Oct 2024 14:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606356; cv=none; b=EVOhfWX93AxXAaPF4pJ6kpf7gJbOt8P6Pdx7CJtfJEEXcyakNPzd59lNL1LuDq3X41WF8mloOL/QUiX2qiLKWbIvfB6Rr5aj18mlZambgJnY2zlTk5kY9Cx5IMSX8i7mneTmset/6i9k/AzjKWBCEAeO9rlJ5QGpzdU6ZnTmRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606356; c=relaxed/simple;
	bh=aJ/CtBVx6FFfVFXY/A0bO7mFfyBTFpF5st9zugN4EtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qawRNf+CAzhux745/03p7PpOxNrul/ZfVT6OR774zSPeY5rsgw/kGtZH/MIJR6ypdLuLxUMCq2djnYDIy6ua0hhRczlqwny4+EGzJXKh1GyqApZtAmbUYn7p+AJQQuZ8D3VE+BQIImLsQ8O9Fe9Q+A1cdrFSAm0NhtLZmuMuRPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7s1WI6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A687C4CEC3;
	Tue, 22 Oct 2024 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729606355;
	bh=aJ/CtBVx6FFfVFXY/A0bO7mFfyBTFpF5st9zugN4EtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7s1WI6/WFEJgromr3RO8VlD+oxUWVWahu3qcL0mvBft3iY3ZekXK2wia2xjrprNV
	 +m3vQJzJElv7nUU9Wjz5Z8CMSfXCBL5sjIzOcgMFS8Dk09l9Nkkbb795fh+h4rc0HG
	 l+SbicRYLgcehwSt2FCKYz5Lw4SQ/gJ6Vx2O6mq3ev7r8w6qz00/y1BADtOxtbN5yi
	 l2UY5CmE1dxaLFrPqyLyy78UD6Vo7fwWITRtFOsHFNokG6kf/VeznBBUFWQsfGAm8z
	 SGfFbOVfSqnOgAsL2TsrfGtv/6x9YIzoaDnTjNcotiRA4XVI6HhCXN8x/XIBE//uRD
	 1hdoAz1WxAg3A==
Date: Tue, 22 Oct 2024 09:12:34 -0500
From: Rob Herring <robh@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Message-ID: <20241022141234.GA450009-robh@kernel.org>
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
 <172958190288.3294457.18338479078694309889.robh@kernel.org>
 <PN0P287MB201901C383FDC879CA7A61A89A4C2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN0P287MB201901C383FDC879CA7A61A89A4C2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>

On Tue, Oct 22, 2024 at 09:22:52AM +0000, Himanshu Bhavani wrote:
> Hi Rob,
> 
> Command  :  
>                  make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml
>  
> Output : 
>                  DTEX    Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.example.dts
>                  DTC [C] Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.example.dtb
>  
> I am not getting any error or warnings 

Try applying the patch you sent. The applied patch truncates the file. 
It looks to me like the line count in the diff chunk is wrong. It says 
153 which is the length of the truncated file.

>  
> I checked dtschema is up to date 
> dtschema Version: 2024.5

Not the latest version, but that doesn't matter here.

> yamllint 1.33.0
> 
> Regards,
> Himanshu


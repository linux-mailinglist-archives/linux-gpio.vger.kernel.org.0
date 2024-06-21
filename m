Return-Path: <linux-gpio+bounces-7613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA1A9126BF
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 15:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 043201F26A0B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 13:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F2C79D8;
	Fri, 21 Jun 2024 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hQZiExZy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF314A20;
	Fri, 21 Jun 2024 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718977011; cv=none; b=gDctmPRNIpB1MuVnm0Zl0K8knlBjDIOe2ZKjwbKlVBkTnlfiQSiHAH7vYJjwmMRRphW0dlWPokbR+hKqNcXxTYYIS8lia6bBnME+0PI/XnokDL1aC9MLTdqUHAdQ83iCHxbjCwuuOWwea8JWC/zZ5qft9BmABbUca6/yZL00PfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718977011; c=relaxed/simple;
	bh=VmXZW32hCjidF+0Rl4VnEUEIwG58npl0O0ibS45psjc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fLhGi9jdtwKNltfHt+YaImXw20pwbbFf1RTNyQETbHrumdiK9BkudRJPym3FKCXlasnzMUP7PFwN56TBRQQKcfzgI8hJAEFSrGdBO0DSyyw4r00CUFCev1u+5gPxT9+CDV1ZE5m27KgedAVOzAa/+mDYN01qpc+yPOuAcNmjGgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hQZiExZy; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LDaaHF052343;
	Fri, 21 Jun 2024 08:36:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718976997;
	bh=jO3qwjFYPAmtp5fMhPJin8eIQO27BhIN/9LFR+mQksc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hQZiExZykvjBDt1MV47J8d9I4eFKrjr17jRdtU4Ywo/91qcZIBeNznGf8lKO/KxO0
	 mTO8cMQEVjxwrECF2v2K1DlKwObvifb+fkES+dL7p3vnZOmjpBygnKVicgemiYOZBN
	 ef70Z9Yu3xqMZnyWKFfjhN1vYdw/kbvRMKZDT8do=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LDaarA114465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 08:36:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 08:36:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 08:36:36 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LDaaHQ046592;
	Fri, 21 Jun 2024 08:36:36 -0500
Date: Fri, 21 Jun 2024 08:36:36 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>, Linus Walleij <linus.walleij@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max count
 for "pinctrl-single,gpio-range"
Message-ID: <20240621133636.wfy3ucf2qkcqphdf@lantern>
References: <20240618165102.2380159-1-nm@ti.com>
 <171873566448.3500109.16734660300499772836.robh@kernel.org>
 <20240618185705.5fwevm7drphgvwl2@dilation>
 <c1b7a47e-cb05-4701-9766-d1fc13612f34@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c1b7a47e-cb05-4701-9766-d1fc13612f34@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 11:19-20240619, Andrew Davis wrote:
[...]

> 
> This binding is a bit of a mess, the phandle is always a pointer to
> a node with the cells length hard-coded to 3. This looks to have been done
> to allow the driver to use the function "of_parse_phandle_with_args" which
> needs a property name for to find the cell count. But that makes no sense
> as the count is always 3, the driver cannot accept any other value. The
> driver should have just looped of_get_property() 3 times but wanted to
> use the helper. So a silly driver mistake has turned into a binding issue.
> 
> We should drop the "pinctrl-single,gpio-range" from the binding and
> fix the driver.

Linus W: pinctrl-single,gpio-range -> any thoughts here? I think it is a
valid (if a bit too flexible design looking at the existing users who
just use a single mux value mapping for all modes)

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


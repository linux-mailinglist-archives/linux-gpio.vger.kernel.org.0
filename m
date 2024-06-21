Return-Path: <linux-gpio+bounces-7615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D555191271E
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 16:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754F228A40C
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Jun 2024 14:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BABF4FC;
	Fri, 21 Jun 2024 14:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="B6pc5jNz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE89186A;
	Fri, 21 Jun 2024 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978433; cv=none; b=iy8pvawsx/ftEpwfJjVMaKs4tsrq4xMI+wL/5Vn71PFL2t6fKqImNKeTxnTNNJN87ORfOSqaLaHUCuBMEU8ptPM/Qdzo9vUqhD1S7Vl4t1kIzdDsSxFAHnJReqJpXG8Q7rb4aTfUcY+GLr1YL0OYuvQB1TeC7oGiqCDB3ukd4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978433; c=relaxed/simple;
	bh=Fm+L2/OUOPOYOqQeH0Y9+vzufEBXL8sO39tCyLYW7GU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SDYyNzqd4cg/x1BmzzxUlEMsgpxMhhKrx/BCY4wKTpxV66+7RkKDmjRjwYCqvQqgbu38Wqss4i328fylBfW1fan165MMKii2KR8/+PWEPOk5bb+ciUEsUp1Oa3pdVvm68LOqG2wAHjAh9ZHinYOfZVHWfl6SEw3oAhv+KRzZtWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=B6pc5jNz; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45LE0ApI058838;
	Fri, 21 Jun 2024 09:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718978410;
	bh=slUowNIaMxLY1ZWIRea1/goRupUh9Ql+Jp+5tsQYlRM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=B6pc5jNzaSYBASVjTgK/xM7aNDMc5BSkbjl8vrY1jB6jPy6H6br+5Rbn9DEBM5PA3
	 iXb3dlY78UZuc6sFzfFrG1ezwCljqNFvLcO8WP2cPSxHHmDIKsZ7AMdG7IQpOJu5ea
	 U1puch2YVlNX/nI4ZMiS7NlLikbOvijvW4Bl3QTY=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45LE0AIc126711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Jun 2024 09:00:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Jun 2024 09:00:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Jun 2024 09:00:10 -0500
Received: from [128.247.81.8] (ula0226330.dhcp.ti.com [128.247.81.8] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45LE0AsV098519;
	Fri, 21 Jun 2024 09:00:10 -0500
Message-ID: <1941910c-527f-4183-98f5-db11cc4e078b@ti.com>
Date: Fri, 21 Jun 2024 09:00:10 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: Define a max count
 for "pinctrl-single,gpio-range"
To: Nishanth Menon <nm@ti.com>, Linus Walleij <linus.walleij@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
References: <20240618165102.2380159-1-nm@ti.com>
 <171873566448.3500109.16734660300499772836.robh@kernel.org>
 <20240618185705.5fwevm7drphgvwl2@dilation>
 <c1b7a47e-cb05-4701-9766-d1fc13612f34@ti.com>
 <20240621133636.wfy3ucf2qkcqphdf@lantern>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20240621133636.wfy3ucf2qkcqphdf@lantern>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 6/21/24 8:36 AM, Nishanth Menon wrote:
> On 11:19-20240619, Andrew Davis wrote:
> [...]
> 
>>
>> This binding is a bit of a mess, the phandle is always a pointer to
>> a node with the cells length hard-coded to 3. This looks to have been done
>> to allow the driver to use the function "of_parse_phandle_with_args" which
>> needs a property name for to find the cell count. But that makes no sense
>> as the count is always 3, the driver cannot accept any other value. The
>> driver should have just looped of_get_property() 3 times but wanted to
>> use the helper. So a silly driver mistake has turned into a binding issue.
>>
>> We should drop the "pinctrl-single,gpio-range" from the binding and
>> fix the driver.

My bad, I meant to say drop "#pinctrl-single,gpio-range-cells" and drop
the phandle from "pinctrl-single,gpio-range".

The #-cells is meant for a producer to define args for a consumer phandle.
This is so common in DT there is a helper function for it. The problem
is the author of the driver here wanted to use that helper, even though it
would be backwards in this case (pinmux is the consumer).

So we have a node inside the pinmux node that exists only to expose a fixed
number (3) of cells so that a different node inside the same pinmux node
could point to itself to make a helper function happy (that didn't need to
be used in the first place)..

Andrew

> 
> Linus W: pinctrl-single,gpio-range -> any thoughts here? I think it is a
> valid (if a bit too flexible design looking at the existing users who
> just use a single mux value mapping for all modes)
> 


Return-Path: <linux-gpio+bounces-25485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E25B41C85
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 13:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB46D1BA41C7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Sep 2025 11:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771432F3C09;
	Wed,  3 Sep 2025 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfhIxdYS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BE42E22A3
	for <linux-gpio@vger.kernel.org>; Wed,  3 Sep 2025 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756897314; cv=none; b=sxFit+7fUY/lcJpPSxD9mKbgxaH957L+p1hqOfsNFhErwBELZrTHsFeCOk2Mrx/jN2AXT35jXo7q7uC+sJplWQYEsLVg+4c0Tl/K5aKt/J0UrGZapalWKD7UWWU2uQ6e8OVO9DHli3p19InrwJ55Ya78fB5iB3XUzf7hFaLYZYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756897314; c=relaxed/simple;
	bh=7+79JLZEdYdW7EsjOhd3wHHBOMun7TICIG2s/RhNN5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6kQhYE/yF3w4ZDsA714WETROqdBWPCJW29sQ24OsqAzcHUb+6KFR9ej5eSF07Ul3R5E9aaWq65QhsaoMzb1+ebQC3HNb/FLZ2EOUwad/t5NzrHtbsdYVgF0J0wbxc/eIaaWg02D8a0A2XX7PJigS/M5AJZCtTcl3rfFaa3Mwi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfhIxdYS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AW640001379
	for <linux-gpio@vger.kernel.org>; Wed, 3 Sep 2025 11:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qLaUOnzcULpuGK96TIq7/Q8T
	lONrYTUZzrvCBlNYoKY=; b=gfhIxdYSD9hWSM17gi+nZEvE52tAge7mklgZUiSY
	RLVdZzhQsHPS09GiP+kqkYxKLgAeirHepKwknoqHGs5nje3t9V4akj8L3kjmLHHB
	7023mAAhkSjr3xJltUO9uF2//Jaluaco1C4GIgcqWWgR/vJHWYvKC8ueBBqHhEDT
	GTjUhGFhKbTUVn/Xfkqp0y3m6x7bgCpnpDWPvGE1ox7Q68dHuu3iWKNr8nwp2uyY
	xKWPHR+6MMOOtqQrFlchmtcUuaUnhguJ3XfORaVQWFi6iDmlm4nivcLEYoFgk4Ql
	ZDASV69+YBO/fTtnqKaJ1h+CbAhW8MJ+GDgzDoWWE+u8Nw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wy797h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 11:01:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7455989dd7fso778037a34.3
        for <linux-gpio@vger.kernel.org>; Wed, 03 Sep 2025 04:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756897311; x=1757502111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLaUOnzcULpuGK96TIq7/Q8TlONrYTUZzrvCBlNYoKY=;
        b=jxwnlPCGmiieORj23Uney5eeu+77PoaPI+iOvIve18/5NWw07J2BjEH2gDt3sitS0z
         NGaE5p2bfEwpZ7O1PODTz7xKUrUUcg9l0Q1z/tw045O8/BF30TL3L9MfI+I7mwIzHYZT
         29P2BPiRg8Ya32OF0y25S1taMgJNb70LEtOAHGrBLSydB8WCVfM24UKnpTryc2Bp0TA8
         etan1gvp45OXwnn/gwX15Exc11CAxWF3uO8OWtCs/K31lGNz1oizX/FqxodD7VD9NbK5
         MkfR1LiWm35phhys8xzbzcJYx0Qf/ow5TdW590AYnv6knFNZipMhHhCHNm9wp+H2Idwt
         Mpnw==
X-Forwarded-Encrypted: i=1; AJvYcCWt3m9KHvMa5bBRdRPURhpYn/+YfzGpMhEfelY8/2zgVBsMI39ZmAjlRi3XdXjb87X/CWRAFEh9Cc0R@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gjgrIqelgNBE8DlKuBKn0NCYyVaS/mzG7oILc+DyAJ6z3W8T
	ed82IFnISIsgqWGFsUJfPm1swJ6tsMQt5TAHn8g7x9jcQ6X6NcOyresD6+biLqd6bgkD3zdUZcO
	7Qq+lYNNtrQs2XeXJW8ckOQXolVFPDfPj1/NxLkSEEoqZdBdq3ewg1Q74xdoUT3OB
X-Gm-Gg: ASbGncsjXu7CaE/6n9SEMmMvwMCwYkvp/6DFUKDhaDRtChv1gjI92R9AqRqUCnXKBAM
	y4ZFBGmArSN1uTvVqhRsq0WKTM66jG2T1cQ+plaJv5lUWycM0AjnvcWdU8GE1N6aX3r17amkfns
	NyuyknIBBRaiTH7bYc8mVVqu89r33H0EASjAPKBy6AQDieB1/rGrmDEP4fWZfBz9t+p2bCOANGr
	c3Yy8V4iTeve+btd8aLNhby6NUe3A+swljYqrOMrtM1dM5LAEblmfsh5qncKbitPaS4QnE5F9Ea
	QxzsVRtLhxTzqyMZAZA9489txk/9uoCABbNLwRwNqB5jPm9BvEMgyt8Yl7YS4du4CEhSQZK/vKq
	hBFpfRjs+pmEL0prKDq7DgzK0yTTvMpX9LIpQLq/a0WZkNnf2F4Us
X-Received: by 2002:a05:6830:6d2e:b0:744:f112:e537 with SMTP id 46e09a7af769-74569ec96f4mr9524798a34.30.1756897310761;
        Wed, 03 Sep 2025 04:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdiePyT62civ6LFTn3goLcy8YW+L9JeKgsjo9tX5PgEGNj1cvGwn1XZZFaj5wacomXsnH2IA==
X-Received: by 2002:a05:6830:6d2e:b0:744:f112:e537 with SMTP id 46e09a7af769-74569ec96f4mr9524761a34.30.1756897310292;
        Wed, 03 Sep 2025 04:01:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ad52b4dsm434598e87.152.2025.09.03.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:01:49 -0700 (PDT)
Date: Wed, 3 Sep 2025 14:01:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, andersson@kernel.org,
        linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rajendra.nayak@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: qcom: Add Glymur pinctrl
 bindings
Message-ID: <d35s5ldfswavajxkj7cg3erd75s2pcyv725iblyfya4mk4ds4g@hekhirg4fz65>
References: <20250813065533.3959018-1-pankaj.patil@oss.qualcomm.com>
 <20250813065533.3959018-2-pankaj.patil@oss.qualcomm.com>
 <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdfb09a2-0053-4a07-85d6-5e15b8bc126a@kernel.org>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b8201f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=FCd5T-TvBLVYlDZUGUwA:9
 a=CjuIK1q_8ugA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Ibs3_D4xZb7rMwuWXFEsBj9Td6O2u9vp
X-Proofpoint-ORIG-GUID: Ibs3_D4xZb7rMwuWXFEsBj9Td6O2u9vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXySDIxtENtxXG
 yuc0cHzpg2giAd+ncCocTBIVUKXmq4q6rBFPyB+XV/dZaroth4Pz7dLYGpoYVWrht7GYaEXUNSa
 6Y0MU1BQo/0qXUwp+/89kfa2mTVW+2PiQmtJgcznY6Ol77U7EYtapX0i7Mwf69ejNUXom+J/JBz
 vyYyxq8EN7aU6BSPs3Ck5xAsyStcC3WF4NkQG3mv1BOmXW+e0+1/4dzrrPklvxHCRd2Ax70wFTN
 XmxoOLoaGxYzlSAAepC+rc+2wfLr5lpLQLLiLdXBHTPdOLEet6CVS/4L0VeQJBO9wYO6/qzgtst
 unBIe1CTPJL9owCAGLiILr3O7lu7yYvcr2g3Cnq705na7SX2J0bmJ61zG2OOqwzyPMr4x+Oejki
 m2njnO0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Wed, Sep 03, 2025 at 12:08:27PM +0200, Krzysztof Kozlowski wrote:
> On 13/08/2025 08:55, Pankaj Patil wrote:
> > Add DeviceTree binding for Glymur SoC TLMM block
> 
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > 
> > Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> > ---
> > Changes in v5:
> > Rebased on top of v6.17-rc1
> 
> 
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,glymur-tlmm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-reserved-ranges:
> > +    minItems: 1
> > +    maxItems: 119
> 
> 124, I guess
> 
> 
> > +
> > +  gpio-line-names:
> > +    maxItems: 250
> > +
> > +patternProperties:
> > +  "-state$":
> > +    oneOf:
> > +      - $ref: "#/$defs/qcom-glymur-tlmm-state"
> > +      - patternProperties:
> > +          "-pins$":
> > +            $ref: "#/$defs/qcom-glymur-tlmm-state"
> > +        additionalProperties: false
> > +
> > +$defs:
> > +  qcom-glymur-tlmm-state:
> > +    type: object
> > +    description:
> > +      Pinctrl node's client devices use subnodes for desired pin configuration.
> > +      Client device subnodes use below standard properties.
> > +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      pins:
> > +        description:
> > +          List of gpio pins affected by the properties specified in this
> > +          subnode.
> > +        items:
> > +          oneOf:
> > +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9])$"

If it's up to 124, then this pattern is incorrect.

> > +            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
> > +        minItems: 1
> > +        maxItems: 36
> > +

-- 
With best wishes
Dmitry


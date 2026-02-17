Return-Path: <linux-gpio+bounces-31748-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFj0EXlZlGkXDAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31748-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:05:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E814BC1D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 13:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CA2B33028F42
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0559E3382D2;
	Tue, 17 Feb 2026 12:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2od4Spr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWBuoyIk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2E5337110
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329904; cv=none; b=JQuGQ1xVSa4H/bwTXttbjbZyvp5bhJu8XzJDNCWro3Y9IDygbfLJTJ8/XpeOnlpHKfSXFlTIBWoD3i9zlzFC9OohnW0i3xpa9ve68AERcIQdbnJPobqOQJHXeaEtj3pTy50q6T5RsDeG6ktBfQN9psbuLNHqBESxgVwP7swAHAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329904; c=relaxed/simple;
	bh=aVUGa3RY796+baDvlhpqGowjESPg44gTPp21C56l+gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sTQtEu9mlPagx0NuNmOCv/qLVMLnWuaedrqzCIgITwTooge7KQTsD1QkohvJwLw+lWmYDzUPStkEyNe11J54ZqvcNDRaTLq7khJSxye9G/sKVI11qy+pjnSzxXxiWP0nweXCklu+SmjcPM7r8q3iZjPE4GSSeV/uOyCq358Ej2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2od4Spr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWBuoyIk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6UjiZ3394972
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WN5A1Uh8FQbkVezplAg2+KPH
	LHpsIMxAUayv8oRBN0g=; b=Q2od4Spr7BKqk1uarSY+TBtIpKjNszSwilu9idhj
	WP9wPjOmr8vnvvA4VBNF55S3+B8ro8frtgHzTFMrqkuIFdhsTddPJOcureeoTSf2
	YeW8gJ5EchSqPxZcLYs57L7K/vEImRd9gR+Z+wVGVtBsYMHe8l1Akt5CgpH8tj2q
	GBZkICyotCFzOe/HQODrfJl3rS0Qfj26Vs1ooTwCX5HSZkLuqW/yd2gtgmLXlOpg
	hKGdf14Wofv/S6R5NAbh8A1Fkj4YQ3LD086SU2UaxucLb+WUF9RrEL0rycLy/Rj5
	+EHZPNx3V2cpE44ijH299VrAmwc/2MYP4VjvMMD4n9/Rtw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khae1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 12:05:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb413d0002so2697800985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 04:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329902; x=1771934702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=YWBuoyIkPvix1p9CnDQdgau5CaG9As8WmcU49uXe1YZ7m+5asoyiWEu4BnMUj8XRku
         qNXgyuevUS6sDV4tekC7sgXUjICUYbpwKhLubvNd/Za8MRMW5bBUhVAHPCBBqfCHpBaJ
         whKz5zySdd6RtfuQMhGF9rdDhoZ/6PKy+QChGIBQWFPo6lIiljVtK8QV9BGnRP8205/C
         nAbOgwWX/zqWykDSTzXues7nvQLTMizZBjvU8yN3dMVA2okWplwBgO0sKs89O2XvGqgC
         TV3+k0SfY7Qh3YqrNxj3GUy7zB1a/ZFwUGZ84idec9WyAOwF8puqlG8hlEhSXL+bDMA5
         WScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329902; x=1771934702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN5A1Uh8FQbkVezplAg2+KPHLHpsIMxAUayv8oRBN0g=;
        b=rueetruWjNacBWDeP9C5ITg1KO93s9PC1R+Xq3HnBmuh0vsrrVOTuV8+vxIJDuFzPS
         z8F6Z+RUuEWYi3OaBHAVaLp8OupA5PMVfm5vEvlYsnvOS261Ivc8ixtqRy7It9sgc3r1
         nzS7sJ5wyDoj7Ge77gFJERJuyADqUjDGTTr33xUo+XqxkHl9XxFHfrUsaMX+BLke+1BK
         oSAxXla3sJYtl7A+HrST1qQIJ0ybOII8PZp6Zd8yp1g8l9BVmFYDiY8EYafFyJtVF68F
         0r0xoKWUywQ04loAIO60JPFzPt+5koWpa1nMaihK++vp9FUliIcPSzMlgpXgLu5dWYB7
         vRMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUKTB3Dtjqe+BTaReb0tJE9jHbylzSA16YYFSwtd6ZifzIvRgnAkzimHX7lN8fg1F5dmUz4GVC1+aW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6clA4k4pNaDN3rahPgB//fxMBmW7TGqYJZ+pIZFO8ixSnWhbe
	g0o5IStu+7WEekvhcqCTl1Rum0gVaYH/zWC4aPM93dNRv7hdlUOtKtVef91cPUWJs1gn/MlbrNA
	+Px/Cztd1t1xcP1cuF5t6pOiY0RHu0Tux9rIVo6ww6EKTHpVYTzaHTF6YBzI0t1gA
X-Gm-Gg: AZuq6aKjZsq/zB/VAYizrd4XKN2h2tl88pTht5+jfzQYIRYkKMWbrvYBTP3iYbxACTm
	Ns+kmlktNccDrlH0f3WChNCVi2hQxBgnHebW+3Syhgy4eNlOdV+4t9j7ESuIhg5kVMX0nsMC03n
	dUX+MegtFpZcOMQmVRNipp/7YwNYGqGDpxQSQ+W0bjQqpmuwxWGhCLifbpWDoGyXaNxldpgsTRA
	VttVtte7aFJqLsXtOjnBb3PmieEfsZLn4N3bA08Z8tcxVbFyl2Dh/yAF7kTTmEB7CI6z5oeWP4I
	uK4ZjdETVWcj9JUGWNUApxKKgRkctJsWveUvfvmmLMdD8SOR8aLDXE2BML87Ai9Xd8tpwl2Fm5L
	suW1EwtVGj1eg9/q3GGzu7RiZQXSnStXQZww/
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242525585a.15.1771329901911;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cb4ac01da8mr1242520585a.15.1771329901366;
        Tue, 17 Feb 2026 04:05:01 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm34676995f8f.26.2026.02.17.04.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:05:00 -0800 (PST)
Date: Tue, 17 Feb 2026 14:04:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Jishnu Prakash <quic_jprakash@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH RFC 6/8] clk: qcom: Remove tcsrcc-sm8750
Message-ID: <gazyoguari56n6t6eaxbfvgv6hsc5jaqtfkhlshkbijsilfuys@cggmczqpzbq2>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-6-cd7e6648c64f@oss.qualcomm.com>
 <sxjrbxwi64ky6dcntpnnbi3y5ujtssz7uno22xiwiqjdhp7rxi@b2nsnmb74vnb>
 <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <270589cf-383c-4062-baad-d232f7eef3d5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6994596f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=OsKXUHKqkhwHkHYPZh4A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: N9aqu7NA3Bdt1cnCFxFpFpAwCH7DG9vG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfX8OZ26Rh7/WLW
 +wmVfvb1QQwH6mtgw9lxLETxCZAA+5P6xSleCYPc6uHv9KzmZkW/E3iwuBjK8fwDdgVLisbXwEE
 QWCiUN3f1k3kB9JxvcbuC6zVtzWFhofCxTc27MizAhlSbn9UGbnYokOPFzMBQE2/OtCbDX3OD4b
 IYIGVmYfvzPSeJ3ZqShztBASDm3BpPouFIoT14t/ZbwZBvdXeJBGMtS0ja8b10hz7lOHT1jBSDb
 f7UKAwgLWnhrBc2sKkJWjn6hHsJ0XuNqUdM7UuQlyuQJQ5lJzE5odigP1e3/R6r0JVCCUgQ/8vu
 JCVEP6dyP7ujKKHkrIcTgoFOtiEY59U9ID6DsHoHsBoFsywjfymDqTkCs304+i1T6vrQMSeV9kW
 AKVcmhhQGdk+Aepgvr7fDDqLmH7QTkc+ZCVDMV/pfLM5GwNZ/I+X4k7ApDaOJ++OxVelPwliQeI
 PXvMCxVkzziiZnbdYoQ==
X-Proofpoint-ORIG-GUID: N9aqu7NA3Bdt1cnCFxFpFpAwCH7DG9vG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31748-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B36E814BC1D
X-Rspamd-Action: no action

On 26-02-17 12:50:50, Konrad Dybcio wrote:
> On 2/17/26 12:48 PM, Abel Vesa wrote:
> > On 26-02-02 15:57:38, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> This is now handled from within the pinctrl subsystem, since there is
> >> no "CC" block inside SM8750's TCSR, as the corresponding hardware is
> >> present within TLMM. Remove the leftovers.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > So bindings remain in then...
> 
> Yes, to limit the explosiveness I decided to reuse the existing
> ones.. I think that's the reasonable way to go

Yeah, realized that after having another look.

Good work.


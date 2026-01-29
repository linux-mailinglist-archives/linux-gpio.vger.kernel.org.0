Return-Path: <linux-gpio+bounces-31291-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC/MFZpAe2mNCwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31291-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:12:26 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC37AF7A5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 12:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BC5F301E9B8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 11:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1394385EEA;
	Thu, 29 Jan 2026 11:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXCHWszN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TR3SZziy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EE37FF67
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685132; cv=none; b=bzp/o9+Hu73LQbOroutEGLF+ZqqgER9EHt9tisXg6Y75QsixiTyeTS9cPtfhODd0/NVBUfz89rfBkavVZY4RHLOGxVYCuPBLOoo4MBLV9SWomjt3yHP1fiJqcVMdoZO8BIjHk5Is0UhZWWioi3Qd/zm7D79s76wR2ge0IDp88mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685132; c=relaxed/simple;
	bh=b0qLj3bGZ9VISb7V+w5w+jMzRzML35qKu1o8EiM2TqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc95vbh7JiEj+j3vvhLiGt6S9FdxE5NX2Lt1RomXyrcf78QKgHS0YtRf5JqF/leXL+Ve3EFgzzxeLQeiB1fzTFnEgG1XfXLiy4UxEylk9r9D3zD0L/MUiLNV21zEqnUerV0ScV+J8Rnuj+M5+1xSDxnDaefNevziTHafDrMoKEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXCHWszN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TR3SZziy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TABiOX2033509
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0FupXbQ+UoqGJn8ZsDum3/4o
	3KYRzZ9BhQgwYqTHnwk=; b=GXCHWszNFdACeArelu8/juMKhMB6xccAM0PzVnHS
	DQa5z1U26qlQ//T7QqCvY988UdRnqS+sMCjysJ9whmP2T7E0F7EeX9OHFSgcrVPw
	L0rXcc/ZI4oJ3i2RQCnDWGglT606/Y9kT8wN/3Lu4uQyRnhLCCn5qJKW75zljSQv
	N6E1337zB85kK44mgGzHp6bWEWR9bxx48p+Hy+QxLQ5LXblr8PlkrScNJA9S1fpl
	OTj+ERXdPuq7d14Xpl63Wp4mR6/89nEE/W7r9ahHKyRHq9GsD6tBw5LxmQppkzwa
	7tUuPmcDcNnzJL1c/c+RPEKMjhzIms0+JCBGt6hB6ehrKA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy27j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 11:12:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a344b86f7so30472176d6.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 03:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769685129; x=1770289929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FupXbQ+UoqGJn8ZsDum3/4o3KYRzZ9BhQgwYqTHnwk=;
        b=TR3SZziyiMesQot+nxVdCv/UCrlG1iGJ9mFQREu9COwRsXxMq6N3P9gpwp/uO6KU8L
         kXXy3Xs+3bwFLdwmdC5hQKriVL99tNrN+jBZmvyK9LkY6iovRVwzrU3XqzGA1foM4mxT
         6u0tyGHkg416qf77DJWSXl4urMnS17mtndGDrRH+zDbAM7rHrJuqFL/uzFb4B2l8iURu
         oiBB2CpxmKjUsgGvZEkiC78DVwYDms/cu0/T6rW4LCGYO2ERcZr48MA1RmLEoducV1Nd
         dNctWdCO80sFq+i5VU3oPhcNjWrUFkrHz724MYcth5ZOCNevxCO70zsoGG7acGyUtxHN
         mZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685129; x=1770289929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FupXbQ+UoqGJn8ZsDum3/4o3KYRzZ9BhQgwYqTHnwk=;
        b=w0PL2CcD6KD9krClXud1lpldQTMZxzdCR2F6RdIcsuZ/iYHY5xV9GTT1aOoO5qleXZ
         WlROlrKo5II5C9t5zky4r+2AqhOzN+CqLc1GA6YK5ea/cyvo1SmpLMf6WcwTjsEisAI3
         zpkP1KAdb91NE4kVEwVje6+3IGbb7+q5tdRpw1nejJMjAgwZnr2cZNHOf5TvxdekPvk7
         OAT3LL0hiKOfgCSmk9G6wk1KzCvneD+C3jJ3jQyiatuOcWpLQurTA6RwQq84sxf/u0hc
         KIiK46iQKuahWUT52z8B3xykOkP2eeNN6FuTYlLZ86MS8c3/bb9P8AynGuQqQEM4ehkp
         QOdw==
X-Forwarded-Encrypted: i=1; AJvYcCXYSja28u4h1bmbWYNHJYLbbfscPxx0Ol/XNRWmWfKdCVWV6OeELaiMRTjc6IjkIaYEw7fum7JSr1yu@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Zx7UAZuzfic63vcfVblySQ4RVf2eWD4d6tVZia5uKMlONwAY
	dNg8No2/YCI3FrbcBClsNMfCpkgn8eoJlrpJkZsruOCyrXiQaZMX+qjCHn+2tgmjDcB+zRvcnu+
	wGagPVVfWuY03W+C955O3fBlZjurzWRm09ZD8Vei9aCuVAd/SIjZEvYT9FeHbKAZX
X-Gm-Gg: AZuq6aKnoCqXKD2MA/mlmscC4eSctXsE37ZW4AK8NYL6dBd5g5wAe5rLufzhDGt+dVG
	TeMRNCpfcVo4WWzefe6Vlh0tbtlClgbCSDQFy0R6C/JMuVKF+FGuPz6DqklrpyTyYWEthA/UPMp
	vCTFzP1kKBzFERAJ/wTb3HfoDir8CN78eRs2SJioPnomcmm9NhkWTxM1Ek85rg2VNxLmRG524Dd
	4aPcRP3qSfZxmW8sE7QJpGkI0457/qT8GvxFVhb40q+AjK9SowMFCs4rXJGmqH9vcr1DedNySTN
	Th+F2i4aNG2ASqu3YzKxNNV+u369CVbbQKJX1Mb5ketfeSax8Tz7FvMGxg76MDP4woVTgaS42lO
	eA7By2NtxyDkahyfoOjxPKlWM
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr1129140785a.90.1769685129188;
        Thu, 29 Jan 2026 03:12:09 -0800 (PST)
X-Received: by 2002:a05:620a:1724:b0:8c3:5a72:b11 with SMTP id af79cd13be357-8c70b92f7c0mr1129137485a.90.1769685128648;
        Thu, 29 Jan 2026 03:12:08 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066beeaf9sm202227295e9.6.2026.01.29.03.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:12:07 -0800 (PST)
Date: Thu, 29 Jan 2026 13:12:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: document the Eliza Top
 Level Mode Multiplexer
Message-ID: <p5rv7u5utnetlt2xvh6ixk2xvi74tdcurgwzrkxfuq7qa3m66u@m7u2ukr46n6j>
References: <20260127-eliza-pinctrl-v2-0-1faf78efdc2e@oss.qualcomm.com>
 <20260127-eliza-pinctrl-v2-1-1faf78efdc2e@oss.qualcomm.com>
 <20260128-hot-camel-of-acumen-eef9f2@quoll>
 <aizrc6xysfwzygdsfeuc2raccq7efmwg5bn6v33t2de6ugvzgi@z3ipf3i25ulf>
 <dc0b7245-de95-4db7-bf8f-815ba60d7adf@oss.qualcomm.com>
 <pdxrotmxjiebyj2gqx6buwupkydngxki6jgv4e6l6fmodzc5v2@yxky3civt3yz>
 <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8360708d-5d82-4cbe-bf0c-31107ab07bac@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA3NCBTYWx0ZWRfX6ocgJun+TV+V
 Hcbni77Kd/AJf9bG4PY6RPD5sEu8UlRhMt+e4Sr6pLY3tmDRmbiJZxeiIr52FHDZAeaWj2Rkovd
 1dH86irbjGfl4sA540hTwr2xh1/C4J/y4QdbxHuFIqe84K8qakf4VUTZBprtI0cI1aVrfNVvxk5
 QETj8/PIdirPRYLt/JtZWrij2cNK6eb0v/QUqe8LOyccT+VibkC43KQYAW5kVVNEWTEWHzbPCVp
 wBkxsV0la+4q6ppe0d3sDPNk/t+zsSrpOHz0QJdzY/Ik9wnVSseAQhHVEEJS3+ScK4jlkPzA6Oe
 toSAzIJClp3iLx2SNftREXCxWzSv6BCHPAV1HHi1g7WXPgCJ5RhNaRaUS260Xf8/SV/GGLZnZER
 zgdZ2DqPjdBtGbL7IxLzN2mt1VJLAcGPYDIk24v6bagNUG39BYSwSCE6pfWpNCsu/wHKPx1vomn
 ah+UblualcGtIRnCPtg==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697b4089 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SiVEXCnccS1Y4FRPPkwA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: EYmYRYsUi8hcZYdU5_u9RsnHNX_xm66h
X-Proofpoint-GUID: EYmYRYsUi8hcZYdU5_u9RsnHNX_xm66h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290074
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31291-lists,linux-gpio=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0EC37AF7A5
X-Rspamd-Action: no action

On 26-01-29 11:45:59, Konrad Dybcio wrote:
> On 1/29/26 11:41 AM, Abel Vesa wrote:
> > On 26-01-29 11:34:07, Konrad Dybcio wrote:
> >> On 1/28/26 6:22 PM, Abel Vesa wrote:
> >>> On 26-01-28 12:38:32, Krzysztof Kozlowski wrote:
> >>>> On Tue, Jan 27, 2026 at 05:47:36PM +0200, Abel Vesa wrote:
> >>>>> Document the Top Level Mode Multiplexer on the Eliza Platform.
> >>>>>
> >>>>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >>>>> ---
> >>
> >> [...]
> >>
> >>>>> +
> >>>>> +  gpio-line-names:
> >>>>> +    maxItems: 185
> >>>>
> >>>> 186, your first GPIO is 0 and last is 185.
> >>>
> >>> Actually it is 0 through 184. The 185 is ufs reset.
> >>
> >> The UFS reset also happens to be a GPIO..
> > 
> > So the gpio-line-names should include the ufs reset,
> > but the pattern not.
> 
> Why not?

ufs reset cannot be configured as gpio, so why would it be part of the
pattern?

For the same reason, it cannot be part of the gpio-line-names either.

All other platforms follow this approach.


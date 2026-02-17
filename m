Return-Path: <linux-gpio+bounces-31747-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOF5MJFWlGm8CwIAu9opvQ
	(envelope-from <linux-gpio+bounces-31747-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:52:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454214B9EB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 12:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8DDC3302DF4F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Feb 2026 11:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC243358B1;
	Tue, 17 Feb 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XxwSyCwS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkPAD5AW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB112335572
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329151; cv=none; b=F1kOjY1Pi5BgZmYgW6i25rIoIbGZG07hPnepzLzNOs8Ir2+1U7A6yYbIwkUmtAv1KUxmPs/wXdvV8uvYghNTheH+kH1dQalKJFodFazHweMqvolMVupCQp6rbLFUAwgkWhaU9ORVTL/nL4Y6mAF/gJv3z255cvqGSnJvKdOb75I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329151; c=relaxed/simple;
	bh=dAnsx0xJtEXMX1K0lbG5+T8XtzHHN4M4bEV/iMzg3/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKjIRydStDpS9X5/FNg6IsX+Frp6JTC9OiGIDhUZBt3/F9R1zSzZzv+zWJRlPSwnCVpKcjMso0d1I2NME2te8zEzPiXMgDsiDnNDqMbUG/AGkAe4fRY0gZemLxIEgNztxKG/vwKgq/7sV9rOV/uAJvzmAUG8Grn5iDN0XUR93do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XxwSyCwS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkPAD5AW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H8q7pN048861
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N8IDiGrvccwFedf96OqEPLL7
	3MTWDtHz1uUgTvkRpt0=; b=XxwSyCwSVkYg9ZYy3G444Kvs3fLIwD2Apwzfr1TS
	l40/gOPfCCvKAFNbwLBJEDSYI4KuworD2tT4AvwDVijktiTyFPxQ2uKZLcxVAWpi
	U2Ls9dwaqJoBIC69vDJGE3TgfgiPyB/kCFcu/oOLEZUIUSOMFDPlb7rArryh5ntw
	RBH42y0AZADFyTleq0GtDIg5ayvnZLTs0Jkesn0+zIHmMxubKfj5/CP3aMxFRepg
	R9tzGWxfuHaE+NIcT7bVBUR7PbMMcaHgbhly+1pDBfPKUeemXooQisaWOfqYjFzx
	vR/PNipT2zssg8DQHAcg16DkMMfBXoo7ItFKGJCiRKkJFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d827fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 11:52:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb5359e9d3so2090262685a.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Feb 2026 03:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329149; x=1771933949; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=YkPAD5AWX4OSjtoPrX/kvKKpH+JF6JGHQ+uU7oGtZFEDshGnlnUXzDuOp5NbI22JBI
         Vs0E/0iPB8Id2BIWGq/0r/e4Ui2+n6vDYGlyqw4MHFEjdzNhql2My3pSqritqM8iHV6t
         7+One3SWD1ntOL8rlKUl/cj5LKyND8t8KQnCciWAsO1Y0aOPHtFuvMbCRRK0nKYNR9zc
         xcll6/SxvyKRK4GMrfzGCKqOrlPXC0111FnErc/WRcmlfzD4z4/b11+BF49Q+P5GgbUw
         KerXwiG68gjIlabBiRzg0XxAo0IfIraUvFt0n2HqmqYbp+J1nOhYjW+VxQ3GT/n7wJF2
         o6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329149; x=1771933949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8IDiGrvccwFedf96OqEPLL73MTWDtHz1uUgTvkRpt0=;
        b=geimRNCPfjrhU+Hc4EYwl0jrxFDGhMQRwkzt0lKt0Z82zVtqTGk3wC0A+LEcWRvXL/
         PL67GGiCJ7LlVLS5JnRoT3hO9+dIOQznuLpeFpGRU9aM2ZbAG8kc6d9dOhy/Kyq/W0Pp
         C3l/n/FDS5ek/b4f7Ga8+gDEH4pQ2+z/eTEJHMAfLGNd/FySIkb51dqDpi+Y8ohvtyIu
         Y9kUVkG6VH1idZep4hSzUx1+5LMPEptOHf9yXewR1YwTK3xBk1YXIqItgTLO7UF9gg2k
         9O/95rnLepa3HLidwkW4/D4nwsOrfuBK+lGrh6mG6Cz8IbnqbiOqsCFqMlW2LVjZHU98
         xFlw==
X-Forwarded-Encrypted: i=1; AJvYcCVD/ArN5kRbNinjtlwiQ8jqM6LuiCphxSgHC5Koge2DOen3IwWnQ4yxxyZlsRFerDs10Iy73xZ+voU7@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBk+XJCoUXImw/SVn4VRrRan8O/8s1eVZMUeM2zBedNRBMGED
	vesjVMKi41u1uDvZm35T1foy7bVVpFkfnSnfXYO43lNvAw9++daND4Cr8bUMnJxTRMl462FinY3
	J/XBUuf5lb49jYFhNT89/UOrodrNZ4S8MmhH0Gksw98jp1jf6AAi+CtmkNXazcKyk
X-Gm-Gg: AZuq6aLGlmfMBNxfIm4VmIcU8PbZ1zC+JRlz34KQQMO10fQkUm9HxLXAyHYu1KhKMw7
	i7j5/RghbMxyiIQfTj9CwIFYNskd0WTYbxwZjebnSqy9UAOLQ97Fc+JJSdZcf5e7v2V3stX2Xim
	hYdWbs9o4VrRoSDP/7A1vy2NUP91doAYAul75AEw57b2dYeSEN2tSSPI+gnX1eHCzblY++BmWO+
	VIkX9jBLLxPnFK1Ta9WTEoUZPlGbasmoV1vhg47naz/9nca67MJ+dQnBvofFcP2MVJ8Ii37L2pZ
	sUrNAe/kuT97SgFzCdhV6PoM+FFdrnn/2hJy3ql9RbvPbM82B45cRT6HcJqq72xuy4nOhyyU9Y9
	u84t8s7pD/T6tu7vNrOoz9MHWXIJenCpM4Ktq
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439783685a.4.1771329149010;
        Tue, 17 Feb 2026 03:52:29 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1439779785a.4.1771329148403;
        Tue, 17 Feb 2026 03:52:28 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d92267bsm769676135e9.0.2026.02.17.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 03:52:27 -0800 (PST)
Date: Tue, 17 Feb 2026 13:52:25 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
        linux-gpio@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 8/8] arm64: defconfig: Remove CONFIG_SM_TCSRCC_8750
Message-ID: <nlx3bt7uchvloqs5kutrtxawq4auorptpp2egjz4wrtepx5zrb@yoxmohxefwgy>
References: <20260202-topic-8750_tcsr-v1-0-cd7e6648c64f@oss.qualcomm.com>
 <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202-topic-8750_tcsr-v1-8-cd7e6648c64f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=6994567e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=DpAI_w27UE3fYZUDY1kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OCBTYWx0ZWRfXzzztMRCxo+1E
 CN7C4Fpt/m89InbNCq+PP+PDay75FXxnAHDcV1JzXgeQbhXkCb2NaEIwrxJsfXCrxxK9FNPsXDR
 FYWRRPs817Q3NbEdI8FkITSEDhYf1O722/aWjkRTTHUHBPLECLGBPviLzPi5+H3aSD7tTRfJx2/
 QSgMt19EeGxk3BcpOuck9/2bY1QsQBWpdu9xOjqp0/0zJWYS3X0+K1RJpQbTEBKvDc/QlHmjGkv
 3Z49bhsQORMUNgrc3Of9o1bLnGk3p0HtUFrEEx+Xk1escDwaO+VKTvNqqz2hyKHRl9L0tNh8qCZ
 mTXs4RjBCA2lyAcAmm8eO32UWoG0eihsg6POdnZ0FuR8RKpHzA+lRa4Me+oVnVcuIoTYuGaN67p
 ykhnpbdujVXWDiIdFUydX0L89P35MhAS7FrszJ9J7KANpER2Hpmbz1M8s/nF0crKBzOwPXqRBv8
 xezDdrCC7jpSjtDhotQ==
X-Proofpoint-GUID: CS3cUL9RFAWhkmBNL6RLjRVPtnL6Eeo5
X-Proofpoint-ORIG-GUID: CS3cUL9RFAWhkmBNL6RLjRVPtnL6Eeo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170098
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
	TAGGED_FROM(0.00)[bounces-31747-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: 7454214B9EB
X-Rspamd-Action: no action

On 26-02-02 15:57:40, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The driver and the config option have been removed. Clean it up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>


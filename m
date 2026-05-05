Return-Path: <linux-gpio+bounces-36194-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJwqMCTj+WmlEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36194-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:31:32 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 619514CD8BE
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 14:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FC50301E805
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 12:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46F7B42B743;
	Tue,  5 May 2026 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QbfqLMlQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPm3si8Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8F53914EE
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777984195; cv=none; b=Y/HIZiXFyyC0cpi9SuRwLdxVR+9z49z1Q3Ni+5SA7aEpv6yt/91Os6PlcD3bbMyE4Z2SE1BrIVVotChcIveC9ChTOS9CGImd0UeQ1hvuxRgkbfbXZFbB3Ca4R0Nd0aZxwDLUFyEiHyYVj9qD+qT3rdHfalfIRhhE17M8Tu7Oag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777984195; c=relaxed/simple;
	bh=Cn51ePjUUcESZFXs4cU/XV6v9vmZu4pMaQvURdoADXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwI6ulIG7xcUvrbCPOdmSPdEgw8PQb0xNJXvI4Y/rZxaUub/1i1YNtUXzBvdKYG8qq4IU4kaC4v/yeBFcMhivUt/sZXRh3mkduDJjPBoFF4WxUQtpLoT2IXHvLnb2NjG2kei1027+A0WSidEy4ZsgFKKV6XhtRFbFT0l13iZxmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QbfqLMlQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPm3si8Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595WXd4028219
	for <linux-gpio@vger.kernel.org>; Tue, 5 May 2026 12:29:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ly2WudEoWjl5NvunnKE2kBuL
	le68whP55xqm57rb0no=; b=QbfqLMlQIl1F9nNhLGQyycHSV5Y6IozVMeC0jfJ0
	r5dT0yXWBBoJxiWyAtzxHHgBHHlhruExfGznMA4rNGqYfvcPaTTTKndb2qfe4LKL
	mokhNGvcxz489xAADIy46+Aaj9zE/LInrqW9H3ZkpueNTECC3qFDmuVNlrUOhVkJ
	TksV58cGSQ33fJDI47Fqe4/tm06rmCKXmgPhQshv6XI/og5SbmnfPifIjliUfRLd
	csrsW6qpVcnw5yz2YfdkVlU6e4zLUqTzDmaMocQdCCPdnqpn35OJi5w/iY3WE3Qx
	NbTd2PSTcHPelcsd77Fo/pIsKPscbzGu30zJURJLtD3edg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6rrt8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 12:29:50 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f13da9684so64282411cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777984189; x=1778588989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ly2WudEoWjl5NvunnKE2kBuLle68whP55xqm57rb0no=;
        b=PPm3si8Q6K4m3CgyoNWCFnyEoso/MSG5KT9/WluEOEQYNdpTM9Q71m4g1hgbV4ua+L
         vjY9yTrPnBmB0ZSj6aRKi+c8xHWmSFPItj4Gw1WXvstdEbyFmqbTde+ofagkBTuPzroq
         uzphY+wLavH6pDXN38YpPXj+Wbnm4L5SMooU7gdyVug5qym8/+xkKN5z+lBCYZuiqOw6
         W2FvoIwoXnG75rjFKUpJzzn24EXAh2qHeeXF3kDZgUyER9oC+vsaisWEVDn2MN9cCuCa
         /0dod7GayNNZjW4vmo0ylbMNIPmY8s68u8bUa3ZjAydSN3nEmlWeUqYsMl1Q+OCz+F/3
         vmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777984189; x=1778588989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ly2WudEoWjl5NvunnKE2kBuLle68whP55xqm57rb0no=;
        b=VOv4YnxP3UBZ7CjbFUtd4a+u/+S/NiCixP9I3NapZ+KLiHsisDZ3z1b+IBTJnqsGCx
         +ymRQ/RR8eoj0bYx7kdU/dwlE+WRpOZ67/0wFzplbwxCfffCmjM1lgTdax4mt+ZEUs8E
         lidBdpuo0ChEazNiiNK7Zha2I9jWx3p7r+Q/i3WBwJrrdzI41mCuBg+F7/uu3qDF1Aeu
         tp2GUl+YIAQlI6PLJr7dwLxioPwKp1GeF3NKly/2BWCAW6kMSMdrNKa6N5FgbDfCy5on
         dXNMiVKtHhlPF63Sj1WK3jSeU8Sh3JIXruyzbm2evkymLofoMikDOJgeyMn23ut+Iwyf
         mVGA==
X-Forwarded-Encrypted: i=1; AFNElJ8IQhjAY3MocdLHMriR4Exhm9CEe0D9aOFUxbl2TZjAuTWavqwfqsgQT6iVqciDQGZpXap0f+GeJ+LA@vger.kernel.org
X-Gm-Message-State: AOJu0YwOagGz9HktjR1ob2JoBZaxOWSOBhlQqwQt11CyNTUTHdLlNUrs
	GYfnnRqxNzCsyM/yfkd/XJ1q9J5JkmnkuT7IFITFdB1X1gmhxjUZU/VaQISQWSjNlTWX81YU+CJ
	giEpOP1SkMtrbTKb9zpbdcf3iVDsNnzIACxDDeUuTSII92Selme3KcmcNiPyjE8voHCTE5C2W
X-Gm-Gg: AeBDieufaeb/h91uCMsUCJXaYTP225/bCNIY4B/I+pX3Ob8XpD/Ec4GVrdE9cVvesTd
	CZKpaKljml3A8XI4HdfaNX1mARHM3k0ZAvUDOC92Ivqo6mxU3kkJTILRnMP60KDccfwMwCDjfqf
	z0tMEsBNZc7a8HqV+N2CoQDjRgyreeU5wwbza1i+ML2U/JknfRdjdBVFjX7nNUrnIgaQyVq3Uf5
	hUW3WzFp+jKzN2NSlGlsrsdZhfnkQ21jg1xucDLsZTSL8ORXxFUIX6AEBStxbZN7x+oJoK9drhr
	+r2dl5D0JQUaHlvtyrYeeKjLTtqgfincO4bhXCd7YlWtZeOZ45JfnrrOAPPVD1sbQOVZNS08kDw
	SapWwHST0y9yWndWPkyVSjBr02UuxJdSzG5+pdIvkI9IcenEEdEAUpqYkNQMcO1bn2C6uUkY7cp
	I/Iv+upKJmZ4qdE+TVxbkcZqefHkZkqebe30TQj8A4nLVVoA==
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr197485701cf.54.1777984189147;
        Tue, 05 May 2026 05:29:49 -0700 (PDT)
X-Received: by 2002:a05:622a:13cf:b0:50b:1e5d:992b with SMTP id d75a77b69052e-5104c15bca1mr197485401cf.54.1777984188676;
        Tue, 05 May 2026 05:29:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c342498sm3810332e87.68.2026.05.05.05.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:29:47 -0700 (PDT)
Date: Tue, 5 May 2026 15:29:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Weber <thomas.x.weber@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Thomas Weber <thomas.weber@corscience.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: qcom: Fix typo
Message-ID: <zt6yi3q6mirawiosllor6oylys7fkf2rwm4zsasotanofy2fgl@xh7gwbhxqmxj>
References: <20260505122412.59208-1-thomas.weber@corscience.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505122412.59208-1-thomas.weber@corscience.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExOCBTYWx0ZWRfX1a1N+kMqhRjL
 O6PWUG5/pl7ZIXPJ3rDKKtHXtcCKh1LjUfRt+Ew4wP9PSWiE0T6kOeBfBFp3RmiiDRtn7G9SqyN
 HXIO42aSBhi05vNKeqosLg6d9PApr9ZrjDmAgKFLJtpoVIfQ8xuoqs/QawUYccGAyds0iTYpcsr
 J8dyphAMIGRq/HXviGUt0RQC3agCCaSyS896b50WX47zxQ5ZJ/w0/hvIJcGsdyDrsVi9+oHcqqk
 qfwO4KViuFgGlBgM5NO9q7HM5dv/s9zp7643n+dW3ynW938MuhQaug4vNyD5jEd76ojo/0fyNs0
 oERcHLgaJYl7w+WNXrumN1OUzic3NekiOoAeQ3uTkjipi8nB3kJmDLnrHVQx3B3zoOVmoy/whYk
 paLfnTlN7pe5i74xhnZw7e3yzDmMyXaZO502s/OFA6BG/o39zMz+WewEso/WYU7HgIvmbZpEzCJ
 Je9h4fhVCSeorENTEmQ==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9e2be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=YBLqvuP4AAAA:8
 a=EUspDBNiAAAA:8 a=OYyYjY58rp-n0skpd8IA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=mCMmONcAb4nW8Nt5RVYK:22
X-Proofpoint-GUID: u54YRYWoMUeZcDJRJaSU2z4q6OPl3BBO
X-Proofpoint-ORIG-GUID: u54YRYWoMUeZcDJRJaSU2z4q6OPl3BBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050118
X-Rspamd-Queue-Id: 619514CD8BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36194-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,corscience.com:email,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, May 05, 2026 at 02:24:12PM +0200, Thomas Weber wrote:
> STRENGH -> STRENGTH
> 
> Signed-off-by: Thomas Weber <thomas.weber@corscience.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


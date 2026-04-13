Return-Path: <linux-gpio+bounces-35122-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMHrDKky3Wl9agkAu9opvQ
	(envelope-from <linux-gpio+bounces-35122-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:15:05 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E433F1DFC
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 20:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C69BE30515EB
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Apr 2026 18:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CD83E2760;
	Mon, 13 Apr 2026 18:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ck3NNKY0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGjeGdJk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A73B7748
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776103736; cv=none; b=ifZ6E0nF5lfi17eW5RaNE+FAsN/PH8mb86U5ajSTdMgf2TR/ltWZdgju6NtLigyPHqQgwEFjZZ77LDwmp2DEqm5cueU4Khdp4JPI8wy0thU5N/rDJvPwBps0+GuUbwZMvxGAfMvAHaRbfXPSAFN4vVCBhbDg0468MtbQXOppJvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776103736; c=relaxed/simple;
	bh=U3T4ZXp5e++JoPuyi/hPI5ZTFURW8q4HjEGmc3O84Jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EObHM5OOZTt9XzqnBxaK+A1bh5HGf+qXvgxEwbQnuBe8eCrrjSLSGDPaQTG2v3y6dLUi9Zbt1aMw2arGwEJO49SS3Wk0FIBVS87+6vFlS1PUSn/CZqxp/cYwpFrluR/16BHXBD8SJUYBjKKYIqM/82XtR6TvFBunvr37VP2JXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ck3NNKY0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGjeGdJk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCXAUe297588
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y6/UGo3lt9u5qAMJxrpInrrd
	xkbpYE578zP9W0JodsM=; b=Ck3NNKY0LOiue+NyiemdvWJZzBgdHE6yJDpR0f0X
	e2jO3YdvKbhbOxWPIr0RrOCGMTdpz8RLVwOy3wFvuD6duQrWo+dGgB66NQc/PwkR
	CFBY+K13fho+B8hzSL1cJKu3+ud4pR/HzTjA19CGflJkeWkz7Yx0qbdqQZ6ZxYGR
	3UQIAxV5fCbFLtCh64TxFtOzX4DuFGCEUV95SE2Zmk6FAzbA0H7wc12prPmLb/A8
	FBPI6tCtSLCozpnxwYEx2XtkBoPrAvSpuFlyD7twI0kuhaDtWXsk06OTB/wCJJhN
	qLVBZemwci/2x5/o2aBYyfjvZ5JF1Bq01HQrNGFV3tfdCg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0kd19pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 18:08:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b52a2d70cso49233631cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 13 Apr 2026 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776103733; x=1776708533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6/UGo3lt9u5qAMJxrpInrrdxkbpYE578zP9W0JodsM=;
        b=RGjeGdJkb7Oz9Ms0ctxTkD/BdrjfBqpsRTYBT8rMyo4eAi+AJSknh4hIcy41+5KNXQ
         b99TvthCcywuWkeIZq7B2D1PWVfB47FkXcasjTxLabmn+tqnWcoofmMyDrzslzQioTni
         UOqj/zK88HQOlhwYHhmExH2XWWA4/TySHb3RRPiE38AktwFViwUwKLc9NYGFmaKDexco
         Wf30tiyFOtUnqnLZHR1cZ7GOuZrvnNMuS2k9JaGj8BHUnyfP1Wa5xC8R5pGudNr7LsAq
         am31oPybA8+12+D10OzhdMH5Av33x16MdztPLpot9pmBGNhebkUtympN0XtOSUnlk18Z
         ZtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103733; x=1776708533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6/UGo3lt9u5qAMJxrpInrrdxkbpYE578zP9W0JodsM=;
        b=R0Epc6O5KIBYHLkJY2AoTNBKl6M06gktLzMWWv/2iMugBOXjUnlYt7S+GDWnoD7wxC
         OOUl2uStyuHoELSGDguQAiaxdMBA/iWBLKUUhiFumiWMB5mwj6DGrMFbHoxyuf7nWYNy
         Fr19qyzIlH7Edyb1Ppo10wbVAY4z3S4B8PdS2AeGgjGKYFHlLZ2NmP/B4Sltbvwp2u/C
         6AOxRg79cdXbDh798N82/WCLZTEYjbtZsLCDi2LkXe6BmQq/HJ5YfoW26hnLRQDVfFOs
         KaOhFgEa0Y3Q7gbAcsDzmTQSneTfLtGEvMWEKOzIGzblcUgtdzrGUubud9xNHeHhNDnm
         d7Cw==
X-Forwarded-Encrypted: i=1; AFNElJ9K011SeEDCJGOiTwgcqevydKMZS3r97OQA+JBbmc8/2ZSBu1ZCmbuTntCZs9DkZbBpzr+Ds52WODqL@vger.kernel.org
X-Gm-Message-State: AOJu0YwXh/SGMqBc8cZLhBV4DV8ZqlQp8ty5xkMqvoK6v/5IBf02hEvH
	31OvoDOeZzOiTTfB2ujhBFwegTMSyvsAmc8pr4XlF6NQDOebIoeZ3Cx0+BCRsr06XI+h59A351w
	fBW8S0e9nTP2LuybiLmXDp+oz27tAmOqoXxWygaEd2cwMNVkQ2AR7kc6olMU7r1dV
X-Gm-Gg: AeBDies1NMd1JSU83myW0RHAr6ecA5Smqx/A2I4zdHwvQK2kXuoiSxVnw7GaCvsT9Ue
	Dgjsrc2vbY8ajNTeIUddUS4DPqZjbxwhmXQzXwq+oWewiD/JzKSnDT/N9N8YRzHq3sK/9xE8yho
	zir0/n2QTNStUsk52aUi+WfN6yRyDAtQXV8MF8V/ET5N0Mtq4xI40Z6EWSNsxGQSi4WCDLf2AAP
	MCR1i1Pcw4F+0wtdzUSkB/jnm79h467cy8+o6pmNVQXD9QAFMYzkLMErfMORquMGgPrf/Rpz49F
	3YBeFeqIwjtaymY2oFBifV4LL7s1wOa9PlNDU22eKBhJeufKa2N/5t7XdF6d747zWmT+/aPTQ7s
	bSU8V27gUR2Xouhmv8ImI1tC1wxPyBPl7NOPmSxMwpRmKZOtG2AhObcNaQlit2pWSufy9y8skLA
	UQSod9kJQuVuE2QPA8n0CgOa3J4XmXTc9LLNysbYDilWeB5g==
X-Received: by 2002:a05:622a:111:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50dd5bea3admr221653621cf.43.1776103733033;
        Mon, 13 Apr 2026 11:08:53 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:50b:4e60:93b7 with SMTP id d75a77b69052e-50dd5bea3admr221652731cf.43.1776103732311;
        Mon, 13 Apr 2026 11:08:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3fc9e668asm827776e87.26.2026.04.13.11.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:08:51 -0700 (PDT)
Date: Mon, 13 Apr 2026 21:08:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Til Kaiser <mail@tk154.de>
Cc: andersson@kernel.org, linusw@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: ipq4019: mark gpio as a GPIO pin function
Message-ID: <yvwne6bgbtofqrkb2rl4akv6uzqp4gdg4gug4dfsncddibvxek@mm6losfiwyup>
References: <20260413135234.4067548-1-mail@tk154.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413135234.4067548-1-mail@tk154.de>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE3OCBTYWx0ZWRfX20KrUK6ErWlk
 o5EJCY8LQMMpngLvA5cB9QBibYkJW+yzgrcuubQjLCM5/hSk9i6rKEAc9dYguIoXTqyStMFVdn2
 PFPnlGCuSR3FM+4lKnKqNMzbB+7of/twQ0i0WQKmCIXXOzVYngg0BO6RmXGwLGPgX1c4eb6ftmI
 iAvLzfFiV31ABnQko1D8v7aWlFYWPG7OJyERWeb9aRroqQUjLtiuXhjhBMqBygonxHExs57i4Pa
 IJ8DhkFlppD8igiCgtJAeuZKqTRgnpJU3wmSTHKWPzGDkq4lWYeY196QCppIuLCz69Bnm7CG6Yo
 NtYikzdeVwuNZaVXCKJmNweNsu360dLUXwkfEXBqB+GPemKbXAERmTMy8CPCsK72oiOGB/sobV0
 UEteQsUlwy7QtZ6ih1n/ui23LT190zLXKr3TabvA9+UbvZB7qq0N4GOrtPsYhn3pncprgXrbtLU
 mtcSnvfbxLvYHMUbUww==
X-Proofpoint-GUID: LKmQymWHi5olwc_hjyLqee3g22FJXCcK
X-Authority-Analysis: v=2.4 cv=D7x37PRj c=1 sm=1 tr=0 ts=69dd3136 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=fUG_z5zisV57Vfcd-u8A:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: LKmQymWHi5olwc_hjyLqee3g22FJXCcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130178
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35122-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tk154.de:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75E433F1DFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 03:52:34PM +0200, Til Kaiser wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> ipq4019 still describes its gpio function with QCA_PIN_FUNCTION(gpio),
> so it is not treated as a GPIO pin function. As a result, GPIO consumers
> can still conflict with pinctrl states that select the "gpio" function.
> 
> Add a QCA_GPIO_PIN_FUNCTION() helper and use it for the ipq4019 gpio
> function, matching how the msm-based qcom drivers handle this.
> 
> This allows ipq4019 to keep the GPIO-related pin configuration in DTS
> without tripping over strict pinmux ownership checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Til Kaiser <mail@tk154.de>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq4019.c | 2 +-
>  drivers/pinctrl/qcom/pinctrl-msm.h     | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry


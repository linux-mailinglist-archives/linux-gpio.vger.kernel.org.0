Return-Path: <linux-gpio+bounces-35824-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kiPsOIj68mlJwQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35824-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 08:45:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118B49E336
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 08:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B383F3015487
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2026 06:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E316377ED4;
	Thu, 30 Apr 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ab9JEHLX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8hjnirZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F44132F75B
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 06:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531521; cv=none; b=oxhiadgu9FC4iOMmYs+K0Tx7rWjJZIv2DZYcMadg3cYq2lJLSSqCErHo3AaaKoTmnq2zsitUaG6XM5kmcxgQcgOfuV3veDniuBBEw8SUEgsnbtz+IBWISaC7dQpHdCGxvDea0YCzFozaGVWc7mkGM3hdFGuWJJBURqOWHKVuVFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531521; c=relaxed/simple;
	bh=9SCXbzviY6OXspooHF0q4LaAr+4xBTp28S9n+XC3BU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liUQw9z0ko0Y+an6q9W3Vg9ZS2j3j6L0hvXY3ZdsHjkfrvDXNpqJRB3kf4eH3F9rRaZi6mVcxb+H14TLfi7/1rFza1GUA310ZLgs+95746Yogl9d2PfxXRlNGPvGy/3y5ngmW5YsQogBJZDjmTGS/dFqRTqhXsgFRemwxPinkxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ab9JEHLX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8hjnirZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U44ZeD2099577
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 06:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=; b=Ab9JEHLXMRjzdwXp
	XxifaZW3IFGwZ4aIZxhPwzwIbH//rxzJmRE2kiVG9HstjIdOzkP20RV796HraJOH
	u0DwMR1T53DIi/b2WMWMNCvYlCnYiq/ORzqxj5fpj3IdFizPpvNX3gw//wNA9pXa
	1Gt+TxV5KqdVAGgJFrif9qfItQR/U332H0UeYoZNoFT3avPWpNFf7Jj6znV7bSrA
	xPRVmZqUb1asTzfLCxcQIC9tkWHAgGhdS1ZdCxAZe5Bom8jboc81K6MI0eSohTGd
	vG1e7TZBJ2zX/eqYsAfgQ4HHk0ao6hLUQ7BP3moKCmNLY//as7l2ojeK3BRa4Wo6
	anwp1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr40fmc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Apr 2026 06:45:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b4678c6171so6459105ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 23:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777531518; x=1778136318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=;
        b=Y8hjnirZ/x8HEbDX5hcq2d51I+uejXeXApakT8eJdgp/cRZY4sPxZjc38t7vO5uElF
         5DYfQWYNL8RyXVwFWENXJHioMFTaCB0KSAyed5RdrD+J6JfHlmceXJ0MhgWbagUk+jvY
         rE7DtDtdPFCoX06hSoBkQZkrZ6pTT19gHVz4Ci/jt8b7T185sBXsJQq4QblMwQCaoCyc
         oKlRw41rbwkFOVJcge6b+6j0fHPQ2TiEJFSLMgVRcxuY5dOVN3LKhYiCwMjUgGW0XLq4
         b0iwYeITDO8++Ax4SycpfJkadjFnPc6nkd/BrwO0kRqPs+fOKniRFnum411wp9TgFWTP
         Nbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777531518; x=1778136318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GCqJLduvd/1QTWe87UsZI1ikcjTcDiUgafH+NTT2m8=;
        b=RRWjH8ywK7ga1OOeY5eu423JRd1QwX0kurrOsGcLOrhUvoJbwoROwlsKNUSDypnP3d
         HO2Y6P2mFR+dqFX9Auyobk8YrqHZ3BeFSH34QYgBPRv327o4Df+b7U4bCb1DpqYTXROC
         T6NoshQp90kNQEHjolzLWSClEcIhiPgpLNigJ6XsSbMp9itTJE8qjDbsa0PKmEMKjpdW
         tuSHTfqOUfieuL7hG+iMpJ3N5aWDKsNuCRq0jMrIoi9vhXxAwDHa9K90KdJcMl9ulkGW
         b3xBzCzCTN7cihRRCh9mY5oxyHSK0lWVLBvA+wIUbNRcdYnPTCDPInSPTF357DO4716x
         GGQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KOAAYqb6rS4xL7+Sou/prGMNwhq6vrbd5VgefgJfAcBeHxMhQGe671/NN9mZ5D/NByfKR3ykJhIE/@vger.kernel.org
X-Gm-Message-State: AOJu0YycDtumXDlAXuOrS/Dud3pWnYgGa16wYBSJ4rZ3LgyXDo7c716A
	LcNDtvH9AXdfiN1jcbO4cy1ovWyY1KMLi8q4pIXpR8sNrKeFAf177XC9612ZS1Du2fbT5rRaLxi
	bae88mcPV0it7/hCDtFnWZhzoUGHZLmvzDNV3InrUJ45vmJ0Q5GSIhDhLE6IA+3OG
X-Gm-Gg: AeBDieup8GHA29yfD83OCTqiLN/Ldn2VOln8jTpPwrNbmEe/ukDxmUoNsLCexrEpOx2
	qRPtSJ5PaToryH3op9dvaWZz+EaV/yQfCd0BSyD1a6Yvscr8wmboW98fMwVodZwBq4gTl0+cwSj
	7QqALX2ZC9N5EBAlCoRRUOkDGUxW96Qlj7tXkYVAbzePN8x1OF17zkuXws7j8GLfkfUadHfw5z/
	uOXemNT5TdNUGmhuwQdzd+EY7yqJUnyN2cM8MzgKwKqn+J0peoHaXHtm74BMtU6dHNcvBehfzgT
	vD9dQZEHaSfn8X8V1sl7SToVaOJTnPqVzIKJtbTZSBO8146AtwhqwwhcjfrK8LuGy8KduCi91PB
	12TzZkFhqWDl9kHKvkhydAiQuQULLnQDe4xgTUhA4KsVmECS0aT/42QL9pxbAQA==
X-Received: by 2002:a05:6a20:a120:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3a3cf86fe19mr1867962637.47.1777531517765;
        Wed, 29 Apr 2026 23:45:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:a120:b0:3a2:d79c:4161 with SMTP id adf61e73a8af0-3a3cf86fe19mr1867919637.47.1777531517182;
        Wed, 29 Apr 2026 23:45:17 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5ccb1fsm4173594b3a.17.2026.04.29.23.45.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 23:45:16 -0700 (PDT)
Message-ID: <e8c670d6-97f2-40a4-8e7e-9b7857b60ad7@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 12:15:12 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Unconditionally mark gpio as wakeup enable
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <20260430-enable_wakeup_capable_gpios-v1-1-5de39bf06094@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f2fa7e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=gK-aurLV-Wj7dvaEeU8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA2NCBTYWx0ZWRfX7cqydoVmxxxZ
 EO5P5O+3kqZiZtYFUF1qk9AN3QH6yy1faFOkVp3l6mfded0UyIq9v/57o+oyk9rsUwc3ttaoPGN
 3SFvedSrhaAKK5zz5suKFhz4pQfSjIBvTA+ycDXUR21jEUh7NJuTRZOh1pff1N9HeDGNYpsnNQT
 rJ0vRfXZjNa336Bcnih8Ku/tq1bQe/plGUZTwwGZ2EsPW8TANvGDmOQqoKenOSVZjdkb7GKd9wP
 XwBMK+LibzAhr5A64BILFpeWYFt+PHrWo0GXM5peYQkDDSOXjTfjv+6tvWByA+eMsg80bDVM5a+
 gx/aZk+Ugp3NGkKowWDbi5tgkzvfumQcR9pdDEiSHNiqnyKAvUwlhfu/In5Ip1sOrND09u6JDFx
 +YC1qQjx2MvJjBLCb2zRhSNcPYPMEHb+ltlmYZng5HxgU3B/h+Dy0fwivvvOBmYeCLSXh0V7bmO
 28BEoen4VM8OkR//lpA==
X-Proofpoint-GUID: yyOVRoCG6f2gkTNTNnLY0wDekPn1kyih
X-Proofpoint-ORIG-GUID: yyOVRoCG6f2gkTNTNnLY0wDekPn1kyih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300064
X-Rspamd-Queue-Id: 5118B49E336
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35824-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/30/2026 11:24 AM, Sneh Mankad wrote:
> The wakeup enable bit needs to be set irrespective of the SoC using PDC or
> MPM as wakeup capable irqchip to allow the GPIO interrupts to be forwarded
> to parent irqchip.
> 
> This is set only for PDC irqchip using additional check skip_wake_irqs
> making it impossible for MPM irqchip to detect the GPIO interrupt during
> SoC low power mode since for MPM irqchip the skip_wake_irqs is always
> false.
> 
> Remove skip_wake_irqs condition when setting wakeup enable bit to allow
> forwarding GPIO interrupts for SoCs using MPM irqchip too.
> 
> Fixes: 76b446f5b86e ("pinctrl: qcom: handle intr_target_reg wakeup_present/enable bits")
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 45b3a2763eb85405fecdd4770ba3d4ab684563f0..96df8eb8f5d3f3bcfe165ac02a07414e491f1178 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1247,7 +1247,7 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
>  	 * While the name implies only the wakeup event, it's also required for
>  	 * the interrupt event.
>  	 */


Pasting full comment from driver, since this is not visible in the diff.

       /*
         * If the wakeup_enable bit is present and marked as available for the
         * requested GPIO, it should be enabled when the GPIO is marked as
         * wake irq in order to allow the interrupt event to be transfered to
         * the PDC HW.
         * While the name implies only the wakeup event, it's also required for
         * the interrupt event.
         */

Can you update in the above comment also to mention both PDC and MPM HW.
While touching this comment, please also correct spelling typo for transfered.

"transferred to the PDC/MPM HW."

Post this update,

Reviewed-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Thanks,
Maulik

> -	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
> +	if (g->intr_wakeup_present_bit) {
>  		u32 intr_cfg;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> @@ -1275,7 +1275,7 @@ static void msm_gpio_irq_relres(struct irq_data *d)
>  	unsigned long flags;
>  
>  	/* Disable the wakeup_enable bit if it has been set in msm_gpio_irq_reqres() */
> -	if (test_bit(d->hwirq, pctrl->skip_wake_irqs) && g->intr_wakeup_present_bit) {
> +	if (g->intr_wakeup_present_bit) {
>  		u32 intr_cfg;
>  
>  		raw_spin_lock_irqsave(&pctrl->lock, flags);
> 
> ---
> base-commit: b4e07588e743c989499ca24d49e752c074924a9a
> change-id: 20260430-enable_wakeup_capable_gpios-cb9439ae8772
> 
> Best regards,



Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D999F6BF33F
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Mar 2023 21:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjCQU5S (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Mar 2023 16:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjCQU5R (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Mar 2023 16:57:17 -0400
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF9161AA7
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:57:11 -0700 (PDT)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-544b959a971so82116277b3.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Mar 2023 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679086631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq4CiYTqfmf4TaYq5krJqAFk8s/TIaovR9UIi5ez0rA=;
        b=RlTeA4P4YaiZyOkLV7otxazXH3cO0lIxxBRDRJqSXbn64TwP+BYDWF+mWAe5HXF7G+
         VoraJA1LYZhAfYMOBwEbigA81sDYZaJQ0Ze+xjeRG5bNqcFhNxXLQSs/sCl/gl9M8d3G
         vY+3m5pTY0rJ7cf1EOVQ2w4kAelvyTMjkOeIwEo1ZVTSzkLDUo+z5mBgAvc0x3NIDIVs
         8L2Ho4IoASnObAL0ItBoxrN0aGrSJ5xjwZarN5AXXV4kLPj3fVixox3lkvA4mQ4iwP2f
         1rqU9V9itwkYqPznGSUHiYI0Joh/xKiD8xkUTa7fVoI6jjbA7DPTFTHZawkOIVXNcFZB
         6Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679086631;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tq4CiYTqfmf4TaYq5krJqAFk8s/TIaovR9UIi5ez0rA=;
        b=f9I+BO01fUs08AK/kSu5Xbvx2YOEg6a3FQNYwrGCe9v8zp5x7syY4WrVkqu8sSn5TY
         CzrAAg+VpgXdd2UEFNIAWR/Llw+kIE6R1BuydPZN/Fse/fKE3brSmPNLPcB8hAeXqKGf
         qrGkSk7t/moK64TXWm2lAxAW16xtVudcFCVCpuWzP1s/P6MM5urjXmefq/Ox5sii4wIe
         pjPnd1+LmYHud2jQrNU8JYimEM4txbRBctLGL3e6oqzaEtXFr5q2sqnIhZ29udZySpx4
         9kpxxNOGRQFtXM1aOsmp1SSTZ8/utdO/GLHNYbJqSgPaARznlMq38oGdyxu7XW+aE5fY
         zrNA==
X-Gm-Message-State: AO0yUKVuEoIiE6QQLUsNQ2Dxv0wRm56Gk/TIby2lTtRpHh86e9+ZQTxg
        UBtPVMgpF4T/BsS39UZP85+GijBsF6qz9gY8JCr2pw==
X-Google-Smtp-Source: AK7set8EcpfwxeXanBkExM/pG+0cpQ1FDxMPFkbktFbcuhw7+EsIYJGKUkkqcd/xAts8rpwpBbNFjlTJKeIYxUdRUaw=
X-Received: by 2002:a81:af46:0:b0:541:693f:cdd1 with SMTP id
 x6-20020a81af46000000b00541693fcdd1mr5289306ywj.9.1679086631025; Fri, 17 Mar
 2023 13:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <1679070482-8391-1-git-send-email-quic_mojha@quicinc.com> <1679070482-8391-2-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1679070482-8391-2-git-send-email-quic_mojha@quicinc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Mar 2023 21:56:59 +0100
Message-ID: <CACRpkdb95V5GC81w8fiuLfx_V1DtWYpO33FOfMnArpJeC9SDQA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] firmware: qcom_scm: provide a read-modify-write function
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 17, 2023 at 5:28=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.com=
> wrote:

> It was released by Srinivas K. that there is a need of
> read-modify-write scm exported function so that it can
> be used by multiple clients.
>
> Let's introduce qcom_scm_io_update_field() which masks
> out the bits and write the passed value to that
> bit-offset. Subsequent patch will use this function.
>
> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

This is starting to reimplement regmap.
In this case regmap_update_bits().

What about just using regmap as accessor for these
registers instead?

Yours,
Linus Walleij

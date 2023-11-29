Return-Path: <linux-gpio+bounces-663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C19A77FD6B9
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 13:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCE58B215C4
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Nov 2023 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77A2F1DDC7;
	Wed, 29 Nov 2023 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVw2qj9T"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42C4D7E
	for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 04:27:36 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-46439cb7039so569383137.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Nov 2023 04:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701260856; x=1701865656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CRCCe7L0mlCaaCjzoKnwv/BqscCaxDSIZoS4PzSgKHU=;
        b=YVw2qj9TsOffJQ2AKxTHJak5wz5SHhzNipP9N72S+P2uXdRieaMnrRDuRqIDN6cBY+
         qz0bfacpJ7T58Ldf6LWasNTnhEW1fn6Lww+jCog4JxzPJoCDKnfe8bFw1ypnsdYnxPnF
         Hgem+wfDM7ocl2XDMd3Xju3Et7dvDqxjQ4baawYSqQyF42NHfs7YQYIna+4p/xkAjmFs
         zTSNptVze9OYCCxz6Yl66bYxhlwIjHSN8HQAjk7kmsyHUKuMl7zkNerhpdijrUWCag7E
         okphEONygs0UH2IbZtFuzpwENLxxyof5o6cDkEw2e9hTgtySGXvStmgWIjnJ8kFolSMs
         ktZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701260856; x=1701865656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRCCe7L0mlCaaCjzoKnwv/BqscCaxDSIZoS4PzSgKHU=;
        b=oR67Jy8I7iYpbojK8sLdZo5twmoWd/VRCQFlxMPu0gJPuH0SP+/kVQ1XoFE8FH6+vt
         zbirFuQAI/JjVOoh9wUVQ7XXj8jp0Okk3vhAb0TfHj1bub0BfKaxsiW/1ciTWCUzSsY+
         Bl4ffKV0lpJsgxp4LnicevTaRSP8uv2/4xNko/8+La1kb0mK2C3V2jyhKErVJXyze1vw
         fTJQd7v90EbBypKZtmGxy54JF1eKrSO9l/CT0BhurwMc1YdgeaYYCZGCTHIwsdeJic8k
         yMpLCxoGQmiBouV3Gd1gkKNqEJQEghOhnKHgo8H9mq4guU3qH6p+5oP4erfgPAd4C+sX
         OWlg==
X-Gm-Message-State: AOJu0YwOVknL2xsW2ifpquxipfVKg/k8Mg1E1vp5ho353VEMRgxNFtss
	jLkPVjdL37cAFH1wM9pdGM75SAiDZbsnmyZiZEI=
X-Google-Smtp-Source: AGHT+IGdvw0+6d4PPlbEPhKeDV8S7RW42ApIFV40HQoSkZ6hZcN0pscB1e9dYULi3bQU5JgfD8Jkufy/AK3Bexb78HA=
X-Received: by 2002:a05:6102:2a45:b0:464:4caf:fb97 with SMTP id
 gt5-20020a0561022a4500b004644caffb97mr987245vsb.27.1701260855943; Wed, 29 Nov
 2023 04:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com>
 <CXB4K7SKB60P.3HQ6SAERTVNGW@ablu-work> <CAEydidkS15-boJh+eTbCRJ_RWL=VxVNNXmTSJXBPKUjGPZOrFg@mail.gmail.com>
 <CXB9VMHQO0YW.2CWER3170BJ64@ablu-work>
In-Reply-To: <CXB9VMHQO0YW.2CWER3170BJ64@ablu-work>
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Wed, 29 Nov 2023 13:27:26 +0100
Message-ID: <CAEydidkPUC1DDw40vQP22XG=ECnttLxmmaUCN2q-Xr+Gq0aadA@mail.gmail.com>
Subject: Re: libgpiod - stop waiting for events after request released
To: Erik Schilling <erik.schilling@linaro.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

It might seem like a small piece of information, yet it is important
when dealing with the libgpiod API.
I think with this I can finish a first version of the C# binding.
Thanks Erik for your help


Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E80572C536
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 14:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235874AbjFLM5L (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 08:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236579AbjFLM4i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 08:56:38 -0400
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0B82D6B
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 05:55:43 -0700 (PDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-783f7e82f2aso1516041241.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686574542; x=1689166542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4Vp2iErYvIWcFPgnrhYjlWQZQ/BioodReDnjRHbz84=;
        b=A405NBVvaADc/+SuSqWZqpf13STp10/b+N2/VQYgtSjyypQAcHioLHXRPCpQv8Ev2f
         MN0VHUusGTWfNwVm0OlLZ7Vwg1io0jEAlZx9ChC+XOe7X4/2bpztBVarjU/PKC8szpqs
         ev0M+fuWqhHYkEwrYIJ2C+76lIQWii3JN1dsdbjhgp8ZGG+aT7qip5ihq04jfR9Hj6cC
         lfov6ENBsvvksywDd3U6Biei9+Sf0JbOoVhD00dsVwIHiO+rrVjY9S1srnVaqQs/sT9l
         UKSG0PsOCcugI5gDi7+g0GtF+K8AjAIcpPocmMavz6KpHms9ieepGJFJMo0QNt5dUveZ
         zxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686574542; x=1689166542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4Vp2iErYvIWcFPgnrhYjlWQZQ/BioodReDnjRHbz84=;
        b=E0JoGeukdnTfefVk+eOgjJCts5vgU3wXEdWC4A7aTi7Nb0ilYvrn5aNi6zAPbGjmrY
         vnNIvwrZeVWNiQhnXTJSdBGpPb6fjNKGZ/k3qgwx7Ch/SWQqVcxuzCfogd+K4vraeGLO
         uQnTHOXwe6LR/ZY3+32Q0ST85cuVWICnqV9oU7YMqHoSPk6t55gFNOgjZYWxkHpXOoyi
         RjyvYlE1OBo4SPFQFdKNIPnt0FHcHHDYSzIVNkvhLoRvHvF3aZZaAyPiBKh1g6eYOFoY
         OxIklvFwb0ASR+KJG6Kf0SfSQkjW9LnNhm001C5dfTRU4bVLXSM2WP8S+kULDPWq1J3g
         FkaQ==
X-Gm-Message-State: AC+VfDzdWrh3tz2myNWczx9Sux7WCSkPIX97cQXeAW4fmKlbxE5ISQcq
        G237mQ2acXKOKj2YUkxqYqDZQeLJVb0GUNCwZ7TfQ4EZ0F7ny43+
X-Google-Smtp-Source: ACHHUZ72wlFybXo8ZZJjX4ThpHwQ0rIPhAhjh3P09xJev7NMwl7Q2aDOhFjrs3Do73mPAcBykzRrK7+NTP57fotFPKQ=
X-Received: by 2002:a67:f501:0:b0:43b:29a2:f5f2 with SMTP id
 u1-20020a67f501000000b0043b29a2f5f2mr3835415vsn.11.1686574542575; Mon, 12 Jun
 2023 05:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <4aeda646-ae02-a59b-0aac-b4ea2d2a887f@linaro.org>
In-Reply-To: <4aeda646-ae02-a59b-0aac-b4ea2d2a887f@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 12 Jun 2023 14:55:31 +0200
Message-ID: <CAMRc=MePqYK3oG_QVKUj2YqipmjyjX=Z+F9N08wb4RKUS0H-3A@mail.gmail.com>
Subject: Re: [libgpiod] Owners of libgiod* crates.io packages
To:     Erik Schilling <erik.schilling@linaro.org>
Cc:     Linux-GPIO <linux-gpio@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 1:12=E2=80=AFPM Erik Schilling
<erik.schilling@linaro.org> wrote:
>
> Hi Bart,
>
> I created a libgpiod-sys package on crates.io now [1]. libgpiod will
> follow soon (will submit a series with some prep work first).
>
> In order to reduce the bus-factor, I would like to add you as owner.
> Would you be willing to log into crates.io once so that your account
> exists (it requires a login with GitHub)?
>
> Let me know if other people should be added (Viresh is added but still
> needs to accept) (or just add them yourself once you are an owner :)).
>
> Alternatively, one could also setup a GitHub organization to manage the
> access. I went with directly adding people for now.
>
> [1] https://crates.io/crates/libgpiod-sys/
>
> - Erik

Done.

Bart

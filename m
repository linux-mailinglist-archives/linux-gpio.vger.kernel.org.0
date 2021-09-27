Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96C14198E7
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 18:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235403AbhI0Qer (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 12:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235285AbhI0Qer (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 12:34:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23279C061575
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 09:33:09 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id dj4so71850569edb.5
        for <linux-gpio@vger.kernel.org>; Mon, 27 Sep 2021 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Qg4pcszleadSvaKiE5Kh2HH38HjSiadhLh5SC5SLN1s=;
        b=LVlnhWmu+AdZ6HacMX4Xx5HjtMR3XgpITHcT3Kl3Bze0AYToJXRS71a9w2giNfCvwz
         sYiJtUxMIprkKRpi9bBpHGtwHvtZhy+NoD/484jz2NPkt76U/pS/PxUlEIjg/InYrJr3
         s7INFN77HbNwnKWkCT3dheGWRt4EaxlXSGXeCKjj5OsgTa2kf8JpMRidn9IqStcjdSjW
         HTx5BGgGIUgor7urW3jZYTTbCsdy+JxB/X3UonT4A8F+/MrtS7OG5cDfF+kjkO4PHvZg
         46ECqHYDOTHjuPPKt0vAPw7NwUsu+NwBPz0DCuWb2rWfHo+KroSEFdZup6VK8n6OW2B+
         MqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:content-transfer-encoding;
        bh=Qg4pcszleadSvaKiE5Kh2HH38HjSiadhLh5SC5SLN1s=;
        b=BcqlDDGHfzzzkDmH1S6F+sZD80NwMCJdfG5nLkktOy4hHyGbVkiyRUUSRoPBfGGxyR
         treqyoyEg3yiuuKln4T8Mh94CscBrIpIuwetzHJHx6S/8V/jUDhVtlDGH6JjosNuSQCk
         hKIYLuApB5nFeQSHPT8t3AE8FmEmOeuuqw3Fo/EWbopSI7EwQsgHsJKqRb/dnLeAM7XX
         5GIDwSuvlnOk+O9zVH43q0uG/yFYWqlh1RhROviJBmXxO9AxGs8REGyFFudkwt7y4/2q
         AMeW+9G70/I1pN7UpFDSKM5mQZzqa3r/DuJQggIknS2yM3mybSD9ZxYv5WTZ8zi1/R75
         2fkw==
X-Gm-Message-State: AOAM533qd1whMtHpqh5+QBtHqrcWpTZChADEnPyLMqMmpK7MAO5yLrEY
        wxpk1X2agBTCITmLKPCWfhXJ/3LMCa7hDDnMjZE=
X-Google-Smtp-Source: ABdhPJzXaBuv4/Eue87dsQrlaCstlbc+N5kjbWeivrgXHffr4bzAsSY6i3jkkpXNVz6oTxHxqq4S/xixPtnSy2YeuPI=
X-Received: by 2002:aa7:d897:: with SMTP id u23mr1036400edq.116.1632760387808;
 Mon, 27 Sep 2021 09:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:a08b:0:0:0:0 with HTTP; Mon, 27 Sep 2021 09:33:06
 -0700 (PDT)
Reply-To: camillejackson021@gmail.com
In-Reply-To: <CAOvqJ2gDzMju-H2+i_hQP8dJA8A60ET4fCt7Drz5CyYVv2SSpw@mail.gmail.com>
References: <CAOvqJ2gDzMju-H2+i_hQP8dJA8A60ET4fCt7Drz5CyYVv2SSpw@mail.gmail.com>
From:   camille jackson <akourtando@gmail.com>
Date:   Mon, 27 Sep 2021 16:33:06 +0000
Message-ID: <CAOvqJ2gRY9AwAbGOyAJpZrt=piUwDyWn6m+JcmxZreh5P4qFcQ@mail.gmail.com>
Subject: Dia bom,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sauda=C3=A7=C3=B5es para voc=C3=AA, espero que voc=C3=AA esteja bem, respon=
da, tenho algo muito
importante para discutir com voc=C3=AA, obrigado
